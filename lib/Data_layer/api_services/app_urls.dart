String BASE_URL = "http://157.20.51.180:5678/";


// Login URLS
String loginUrl = "api/auth/send-otp";
String resendOtpUrl = "api/auth/resend-otp";
String verifyUrl = "api/auth/verify-otp";
String socialAuthLoginUrl = "api/auth/social-login";



// On Board Urls
String postBasicInfoUrl = "api/auth/update-basicInfo";
String postform2Url = "api/auth/update-preferences";
String postform3Url = "api/auth/update-interests";
String getInterestUrl = "api/interest/get";
String postform4Url = "/api/auth/update-aboutYourSelf";
String postform5Url = "api/auth/update-images";


// PROFILE URLS
String getMyProfileUrl = "api/user/get-myProfile";
String getMyLikeUrl = "api/user/get-my-likes";
String getOtherUserProfileUrl = "api/user/get-other-profile/"; // <--- ID PASS


// USERS URLS
String editUserProfileUrl = "api/auth/get-edit-user";
String postEditUserProfileUrl = "api/auth/edit-user";
String postBlockUserUrl = "api/user/block-user/";  // <--- ID pass
String getBlockUserUrl = "api/user/get-myblock-user";
String postUnblockUserUrl = "api/user/unblock-user";  // <--- ID pass
String postDeleteUserUrl = "api/user/delete-user";

// DASHBOARD URLS
String getDashboardUrl = "api/dashboard/get-dashboard";
String getLatestMatchesUrl = "api/dashboard/get-latest-Matches";
String postSwipeUserUrl = "api/dashboard/swipe-User";
String postMarkMatchSeenUrl = "api/dashboard/mark-match-seen";
String postUpdateLatLongUrl = "api/user/update-location";
String getSubscriptionUrl = "api/subscription/get-plans";


// NOTIFICATION
String postNotificationUrl = "api/settings/update-Notification-setting";
String getNotificationUrl = "api/settings/get-Notification-setting";


// MESSAGE URLS
String getInboxUrl = "api/message/get-inbox";
String getChatUrl = "api/message/get-chat";  // <--- ID pass
