import React, { useRef, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  Image,
  Dimensions,
  TouchableOpacity,
  ScrollView,
  SafeAreaView,
  Platform,
} from "react-native";
import { FontAwesome, MaterialIcons } from "@expo/vector-icons";
import {
  actionOverlay,
  circularLoader,
  commonAppBar,
  inputBox,
  reUsableOverlayWithButton,
} from "../../components/commonComponents";
import MyStatusBar from "../../components/myStatusBar";
import { Colors, commonStyles, Fonts, screenWidth, Sizes } from "../../constants/styles";
import SwipeableTabs from "../../components/swipeableTabs";
import { ParcelCard, ParcelLoadingCard } from "../../components/parcelCard";
import { FlatList, TextInput } from "react-native-gesture-handler";
import Ionicons from "react-native-vector-icons/Ionicons";
import { Tracking } from "../../components/tracking";
import { Overlay } from "@rneui/themed";

const OrderDetailScreen = ({ navigation }) => {
  const [isOfferModalVisible, setOfferModalVisible] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [offerPrice, setOfferPrice] = useState("200");
  const [isAccepted, setIsAccepted] = useState(false);
   const [showRateNowDialog, setshowRateNowDialog] = useState(false);
     const [rating, setRating] = useState(0);
const [feedBack, setFeedBack] = useState("");

  const handleOfferSubmit = () => {};

  const handleCheckout = () => {
    setIsAccepted(true);
  };

  const image = null;

  const VehicleDetailTab = () => {
    return (
      <>
        <ScrollView style={styles.content} showsVerticalScrollIndicator={false}>
          <View style={styles.userContainer}>
            <View style={styles.userInfo}>
              {image ? (
                <Image source={{ uri: image }} style={styles.userImage} />
              ) : (
                <View style={styles.userImagePlaceholder}>
                  <MaterialIcons
                    name="person"
                    size={26}
                    color={Colors.grayColor}
                  />
                </View>
              )}
              <View style={styles.userDetails}>
                <Text style={styles.userName}>Alok</Text>
                <Text style={{ ...Fonts.grayColor12Medium }}>
                  TATA Mini Truck
                </Text>
              </View>
            </View>

            <TouchableOpacity
              onPress={() => navigation.navigate("ChatScreen")}
              style={styles.chatIcon}
            >
              <MaterialIcons name="chat" size={26} color="teal" />
            </TouchableOpacity>
          </View>
          <View style={styles.locationsContainer}>
            <LocationItem
              title="Source Address"
              address="Vadgaon Bk Pune 411041 Vadgaon Bk Pune 411041 Vadgaon Bk Pune 411041 Vadgaon Bk Pune 411041"
            />
            <LocationItem
              title="Destination Address"
              address="Vadgaon Bk Pune 411041 411041 Vadgaon Bk Pune 411041"
            />
          </View>

          <View style={styles.section}>
            <View style={styles.divider} />
            <Text style={styles.sectionTitle}>Vehicle Capacity:</Text>
            <View style={styles.divider} />
            <View style={{ marginTop: 8 }}>
              <DetailRow label="Height" value="20 m" />
              <DetailRow label="Width" value="10 m" />
              <DetailRow label="Length" value="19 m" />
              <DetailRow label="Weight" value="20 Kg" />
            </View>
            <View style={styles.divider} />
            <Text style={styles.sectionTitle}>Progress</Text>
            <View style={styles.divider} />
          </View>
          {/* <View style={styles.divider} /> */}
         
           <Tracking />

          
        </ScrollView>
      </>
    );
  };

  const closeOfferModal = () => {
    setOfferModalVisible(false);
  };

  const ParcelDetail = () => {
    return (
      <>
        <ScrollView style={styles.content} showsVerticalScrollIndicator={false}>
          <View style={styles.locationsContainer}>
            <LocationItem
              title="Pickup Address"
              address="Vadgaon Bk Pune 411041 Vadgaon Bk Pune 411041 Vadgaon Bk Pune 411041 Vadgaon Bk Pune 411041"
            />
            <LocationItem
              title="Delivery Address"
              address="Vadgaon Bk Pune 411041 411041 Vadgaon Bk Pune 411041"
            />
          </View>

          <View style={styles.section}>
            <View style={styles.divider} />
            <Text style={styles.sectionTitle}>Parcel Detail:</Text>
            <View style={styles.divider} />
            <View style={{ marginTop: 8 }}>
              <DetailRow label="Height" value="20 m" />
              <DetailRow label="Width" value="10 m" />
              <DetailRow label="Length" value="19 m" />
              <DetailRow label="Weight" value="20 Kg" />
              <DetailRow label="Value" value="200 ₹" />
            </View>
          </View>

          <View style={styles.section}>
            <View style={styles.divider} />
            <Text style={styles.sectionTitle}>Payment Detail :</Text>
            <View style={styles.divider} />
            <View style={{ marginTop: 8 }}>
              <DetailRow label="Delivery Charge" value="299 $" />
              <DetailRow label="Insurance Charge" value="9 $" />
              <DetailRow label="GST" value="2 $" />
              <DetailRow label="Platform & Handeling Charge" value="19 $" />
              <DetailRow label="Total" value="343 $" />
            </View>
          </View>
          <View style={styles.divider} />
        </ScrollView>
      </>
    );
  };

  const LocationItem = ({ title, address }) => {
    return (
      <View style={styles.locationItem}>
        <View style={styles.locationMarker}>
          <MaterialIcons name="location-on" size={20} color="teal" />
        </View>
        <View style={styles.locationInfo}>
          <Text style={{ ...Fonts.blackColor14Bold, marginBottom: 4 }}>
            {title}
          </Text>
          <Text style={Fonts.grayColor12Medium}>{address}</Text>
        </View>
      </View>
    );
  };

  const DetailRow = ({ label, value }) => {
    return (
      <View style={{ ...commonStyles.rowSpaceBetween, paddingVertical: 8 }}>
        <Text style={Fonts.blackColor12SemiBold}>{label}:</Text>
        <Text style={Fonts.blackColor12SemiBold}>{value}</Text>
      </View>
    );
  };
  const offerOverlay = () => {
    return (
      <View style={{ padding: 10 }}>
        <Text
          style={{
            textAlign: "center",
            fontSize: 14,
            fontWeight: "700",
            marginBottom: 10,
            color: Colors.primaryColor,
          }}
        >
          UPDATE OFFERED AMOUNT
        </Text>
        <TextInput
          style={styles.boxInput}
          placeholder="Amount You are Willing to Pay"
          placeholderTextColor="gray"
          value={offerPrice}
          onChangeText={(text) => {
            setOfferPrice(text);
          }}
          keyboardType="numeric"
        />
      </View>
    );
  };
  function rateNowDialog() {
    return (
      <Overlay
        isVisible={showRateNowDialog}
        onBackdropPress={() => setshowRateNowDialog(false)}
        overlayStyle={styles.dialogStyle}
      >
        <View>
          <Image
            source={require("../../../assets/images/rating.png")}
            style={styles.ratingImageStyle}
          />
          <Text
            style={{
              ...Fonts.blackColor18Medium,
              textAlign: "center",
              marginHorizontal: Sizes.fixPadding * 2.0,
            }}
          >
            Share Your Exprience
          </Text>
          {ratingInfo()}
          <View
                  style={{
                    padding: 5,
                    margin: 10,
                    borderWidth: 1,
                    borderColor: "#ccc",
                    borderRadius: 4,
                  }}
                >
                  <TextInput
                    placeholder="Give a Small FeedBack..."
                    value={feedBack}
                    onChangeText={(text)=>setFeedBack(text)}
                    style={{
                      ...Fonts.blackColor12Medium,
                      paddingTop: Sizes.fixPadding,
                      paddingHorizontal: Sizes.fixPadding,
                      textAlignVertical: "top",
                      height: 100,
                    }}
                    placeholderTextColor={Colors.grayColor}
                    cursorColor={Colors.primaryColor}
                    selectionColor={Colors.extraLightGrayColor}
                    multiline
                  />
                </View>
          <View
            style={{
              ...commonStyles.rowAlignCenter,
              marginTop: Sizes.fixPadding,
            }}
          >
            <TouchableOpacity
              activeOpacity={0.8}
              onPress={() => {
                setshowRateNowDialog(false);
              }}
              style={{
                ...styles.noButtonStyle,
                ...styles.dialogYesNoButtonStyle,
              }}
            >
              <Text style={{ ...Fonts.blackColor16Medium }}>Cancel</Text>
            </TouchableOpacity>
            <TouchableOpacity
              activeOpacity={0.8}
              onPress={() => {
                setshowRateNowDialog(false);
              }}
              style={{
                ...styles.yesButtonStyle,
                ...styles.dialogYesNoButtonStyle,
              }}
            >
              <Text style={{ ...Fonts.whiteColor16Medium }}>Submit</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Overlay>
    );
  }

  function ratingInfo() {
    return (
    <View style={styles.ratingWrapStyle}>
  {[1, 2, 3, 4, 5].map((star) => (
    <MaterialIcons
      key={star}
      name={rating >= star ? "star" : "star-border"}
      size={screenWidth / 12.5}
      color={Colors.primaryColor}
      onPress={() => setRating(star)}
    />
  ))}
</View>

    );
  }
  return (
    <SafeAreaView style={styles.container}>
      <MyStatusBar />
      {commonAppBar("Order Detail", navigation)}
      
      <SwipeableTabs
        titles={["Vehicle Detail", "Parcel & Payment Detail"]}
        components={[<VehicleDetailTab />, <ParcelDetail />]}
      />
        
      <View style={styles.bottomButtons}>
        <TouchableOpacity
          activeOpacity={0.6}
          onPress={() =>setshowRateNowDialog(true)}
          style={{ ...commonStyles.outlinedButton, flex: 1 }}
        >
          <Text style={commonStyles.outlinedButtonText}>Rate Order</Text>
        </TouchableOpacity>
        <TouchableOpacity
          activeOpacity={0.7}
          onPress={handleCheckout}
          style={{
            ...commonStyles.button,
            flex: 1,
            backgroundColor: isAccepted
              ? Colors.primaryColor
              : Colors.grayColor,
          }}
        >
          <Text style={commonStyles.buttonText}>Cancel Order</Text>
        </TouchableOpacity>

      </View>
      {rateNowDialog()}
      {circularLoader(isLoading)}
      {reUsableOverlayWithButton(
        offerOverlay,
        handleOfferSubmit,
        closeOfferModal,
        isOfferModalVisible,
        setOfferModalVisible
      )}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.whiteColor,
  },
  content: {
    flex: 1,
  },
  userContainer: {
    ...commonStyles.rowSpaceBetween,
    padding: 16,
  },
  userInfo: {
    ...commonStyles.rowAlignCenter,
  },
  userImagePlaceholder: {
    width: 45,
    height: 45,
    borderRadius: 25,
    backgroundColor: Colors.extraLightGrayColor,
    justifyContent: "center",
    alignItems: "center",
  },
  boxInput: {
    borderWidth: 1,
    borderColor: "#ddd",
    borderRadius: 8,
    padding: 12,
    fontSize: 12,
    backgroundColor: "#f5f5f5",
    marginBottom: 15,
    height: 45,
  },
  userImage: {
    width: 50,
    height: 50,
    borderRadius: 25,
  },
  userDetails: {
    marginLeft: 12,
  },
  userName: {
    ...Fonts.blackColor16Bold,
    color: Colors.primaryColor,
    marginBottom: 4,
  },
  chatIcon: {
    alignItems: "flex-end",
  },
  divider: {
    height: 1,
    backgroundColor: Colors.extraLightGrayColor,
  },
  section: {
    padding: 16,
  },
  sectionTitle: {
    ...Fonts.blackColor14Bold,
    marginVertical: 8,
  },
  locationsContainer: {
    paddingHorizontal: 16,
    marginTop: 16,
  },
  locationItem: {
    flexDirection: "row",
    marginBottom: 16,
  },
  locationMarker: {
    width: 24,
    alignItems: "center",
  },

  locationInfo: {
    flex: 1,
    marginLeft: 8,
  },

  bottomButtons: {
    flexDirection: "row",
    padding: 16,
    borderTopWidth: 1,
    gap: 10,
    borderTopColor: Colors.extraLightGrayColor,
  },

  listContainer: {
    padding: 5,
    flexGrow: 1,
  },
  emptyContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    paddingVertical: 60,
  },
 // rating
  dialogStyle: {
    backgroundColor: Colors.whiteColor,
    borderRadius: Sizes.fixPadding - 5.0,
    width: "85%",
    padding: 0.0,
    elevation: 0,
  },
  dialogYesNoButtonStyle: {
    flex: 1,
    ...commonStyles.shadow,
    borderTopWidth: Platform.OS == "ios" ? 0 : 1.0,
    padding: Sizes.fixPadding,
    alignItems: "center",
    justifyContent: "center",
  },
  noButtonStyle: {
    backgroundColor: Colors.whiteColor,
    borderTopColor: Colors.extraLightGrayColor,
    borderBottomLeftRadius: Sizes.fixPadding - 5.0,
  },
  yesButtonStyle: {
    borderTopColor: Colors.primaryColor,
    backgroundColor: Colors.primaryColor,
    borderBottomRightRadius: Sizes.fixPadding - 5.0,
  },
  dialogCancelTextStyle: {
    marginVertical: Sizes.fixPadding,
    marginHorizontal: Sizes.fixPadding * 2.0,
    textAlign: "center",
    ...Fonts.blackColor18Medium,
  },
  ratingImageStyle: {
    marginTop: Sizes.fixPadding * 1.5,
    width: 70.0,
    height: 60.0,
    resizeMode: "contain",
    alignSelf: "center",
  },
  ratingWrapStyle: {
    ...commonStyles.rowAlignCenter,
    justifyContent: "center",
    marginVertical: Sizes.fixPadding + 5.0,
  },
});

export default OrderDetailScreen;
