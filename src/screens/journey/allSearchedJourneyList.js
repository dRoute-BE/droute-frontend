import React, { useEffect, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  RefreshControl,
  SafeAreaView,
} from "react-native";

import {
  Colors,
  commonStyles,
} from "../../constants/styles";
import { commonAppBar } from "../../components/commonComponents";
import Icon from "react-native-vector-icons/MaterialCommunityIcons";
import MyStatusBar from "../../components/myStatusBar";
import { JourneyCardSkeleton, JourneyCard } from "../../components/userSideJourneyCard";
import { filterJourneyByCourierId } from "../../redux/thunk/courierThunk";
import { useDispatch, useSelector } from "react-redux";
import { selectAuthloader } from "../../redux/selector/authSelector";

const JOURNEYS = [
  {
    id: "1",
    avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/800px-User_icon_2.svg.png",
    driverName: "Driver Name",
    rating: 4.5,
    sourceCity: "Pune",
    sourceTime: "12/08/25 3:00PM",
    sourceAddress: "123 MG Road, Pune, Maharashtra 411045",
    destinationCity: "Mumbai",
    destinationTime: "12/08/25 8:00PM",
    destinationAddress: "456 Marine Drive, Mumbai, Maharashtra, 411041",
    weightCapacity: "200 kg",
    volumeCapacity: "30 m^3",
  },
  {
    id: "2",
    avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/800px-User_icon_2.svg.png",
    driverName: "Driver Name",
    rating: 4.5,
    sourceCity: "Pune",
    sourceTime: "12/08/25 3:00PM",
    sourceAddress: "123 MG Road, Pune, Maharashtra 411045",
    destinationCity: "Mumbai",
    destinationTime: "12/08/25 8:00PM",
    destinationAddress: "456 Marine Drive, Mumbai, Maharashtra, 411041",
    weightCapacity: "200 kg",
    volumeCapacity: "30 m^3",
  },
  {
    id: "3",
    avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/800px-User_icon_2.svg.png",
    driverName: "Driver Name",
    rating: 4.5,
    sourceCity: "Pune",
    sourceTime: "12/08/25 3:00PM",
    sourceAddress: "123 MG Road, Pune, Maharashtra 411045",
    destinationCity: "Mumbai",
    destinationTime: "12/08/25 8:00PM",
    destinationAddress: "456 Marine Drive, Mumbai, Maharashtra, 411041",
    weightCapacity: "200 kg",
    volumeCapacity: "30 m^3",
  },
];

const AllSearchedJourneyList = ({ navigation, route }) => {
  const isLoading = useSelector(selectAuthloader);
  const { courierId } = route?.params;
  const dispatch = useDispatch();
  const [filteredJourneys, setFilteredJourneys] = useState([]);
  const [refreshing, setRefreshing] = useState(false);

  useEffect(() => {
    let isMounted = true;

    const fetchJourneys = async () => {
      if (filteredJourneys.length === 0) {
        const response = await dispatch(filterJourneyByCourierId(courierId));
        if (filterJourneyByCourierId.fulfilled.match(response)) {
          if (isMounted)
            setFilteredJourneys(response?.payload?.data || []);

          await dispatch(
            showSnackbar({
              message: response?.payload?.message,
              type: "success",
              time: 2000,
            })
          );
        }
      }
    };
    fetchJourneys();

    return () => {
      isMounted = false;
    };
  }, []);

 const handleRefresh = async () => {
  
  setRefreshing(true);
  try {
    const response = await dispatch(filterJourneyByCourierId(courierId));
    if (filterJourneyByCourierId.fulfilled.match(response)) {
      setFilteredJourneys(response?.payload?.data || []);
      await dispatch(
        showSnackbar({
          message: response?.payload?.message || "Journeys refreshed",
          type: "success",
          time: 2000,
        })
      );
    } else {
      await dispatch(
        showSnackbar({
          message: response?.payload?.message || "Failed to refresh journeys",
          type: "error",
          time: 2000,
        })
      );
    }
  } finally {
    setRefreshing(false);
  }
};


  useEffect(() => {
    console.log("filtered journey = ", filteredJourneys);
  }, [filteredJourneys]);

  const handleCardClick = (item) => {
    navigation.navigate("VehicleAndParcelDetail", { item, courierId });
  };

  return (
    <SafeAreaView style={styles.container}>
      <MyStatusBar />
      {commonAppBar("All Matching Vehicles", navigation)}

      {isLoading ? (
        <View style={{ paddingTop: 60, marginHorizontal: 10 }}>
          <JourneyCardSkeleton count={5} />
        </View>
      ) : (
        <ScrollView
          contentContainerStyle={styles.scrollContainer}
          refreshControl={
            <RefreshControl
              refreshing={refreshing}
              onRefresh={handleRefresh}
              colors={["#9Bd35A", "#101942"]}
              tintColor="#101942"
            />
          }
        >
          {filteredJourneys.length > 0 ? (
            filteredJourneys.map((item) => (
              <TouchableOpacity
                activeOpacity={0.8}
                key={item.id}
                onPress={() => handleCardClick(item)}
              >
                <JourneyCard data={item} />
              </TouchableOpacity>
            ))
          ) : (
            <View style={styles.emptyContainer}>
              <Icon
                name="map-search-outline"
                size={60}
                color={Colors.grayColor}
              />
              <Text style={styles.emptyText}>Matching Journey Not found</Text>
            </View>
          )}
        </ScrollView>
      )}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.bodyBackColor,
  },
  scrollContainer: {
    paddingBottom: 60,
    paddingHorizontal: 16,
    paddingTop: 60,
  },
  emptyContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    paddingVertical: 60,
  },
  emptyText: {
    fontSize: 14,
    color: Colors.grayColor,
    marginTop: 12,
  },
});

export default AllSearchedJourneyList;
