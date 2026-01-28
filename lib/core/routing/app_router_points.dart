enum AppRouterPoints {
  loading(name: 'Loading', path: '/loading'),
  login(name: 'Login', path: '/login'),
  lobby(name: 'Lobby', path: '/lobby'),
  chats(name: 'Chats', path: '/chats'),
  ranking(name: 'Ranking', path: '/ranking'),
  contacts(name: 'Contact', path: '/contacts'),
  profile(name: 'Profile', path: '/profile'),
  editProfilePage(name: 'Edit_Profile_Page', path: '/edit_profile_page'),
  changeSingleValuePage(
    name: 'Change_Single_Value_Page',
    path: '/change_single_value_page/:initial/:title',
  ),
  editNativeLanguagePage(
    name: 'Edit_Native_Language_Page',
    path: '/edit_native_language_page',
  ),
  editEnglishLevelPage(
    name: 'Edit_English_Level_Page',
    path: '/edit_english_level_page/:level',
  ),
  editAgePage(
    name: 'Edit_Age_Page',
    path: '/edit_age_page/:age',
  ),
  editLocationPage(
    name: 'Edit_Location_Page',
    path: '/edit_location_page/:location',
  ),
  editInterestsPage(
    name: 'Edit_Interests_Page',
    path: '/edit_interests_page',
  ),
  settingsPage(
    name: 'Settings_Page',
    path: '/settings_page',
  ),
  changeEmailPage(
    name: 'Change_Email_Page',
    path: '/change_email_page',
  ),
  changePasswordPage(
    name: 'Change_Password_Page',
    path: '/change_password_page',
  ),
  faqPage(
    name: 'FAQ_Page',
    path: '/faq_page',
  ),
  chatPage(name: 'Chat_Page', path: '/chat_page'),
  initialInfo(name: 'Initial_Info', path: '/initial_info'),
  afterCallPage(name: 'After_Call_Page', path: '/after_call_page');

  const AppRouterPoints({required this.name, required this.path});

  final String name;
  final String path;
}
