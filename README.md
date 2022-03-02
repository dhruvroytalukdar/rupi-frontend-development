# flutterFrontEnd
**Description**: Flutter frontend for application

**Testcases**

Sign-in:
- A signin and signout :
    - with username and password
    - social auth
        - google
        - facebook

Sign-up:

- A single google auth signin and signout :
    - with username and password
    - social auth
        - google
        - facebook
- A sign-in with created User
    - If auto sign-in post sign up, then we can leave this.
    

Forgot password: (harder)
- Check if the library provides a way to test this

### [Widget Tests:](https://docs.flutter.dev/testing#widget-tests)
- Test for all the social buttons, textboxes, our own sign-in, sign-up/ create account, forgot password
- Example Screenshots on Notion

# Testing on the MVP Frontend

## Welcome Screen

![WhatsApp Image 2022-03-02 at 9.56.14 PM.jpeg](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4b9a4f21-6b48-4f5a-b94d-1a8890fb3f54/WhatsApp_Image_2022-03-02_at_9.56.14_PM.jpeg)

### Testing the Widgets:

- [x]  Widget Test if the “Login with Facebook” button loaded correctly or not.
- [x]  Widget Test if the “Login with Google” button loaded correctly or not.
- [x]  Widget Test if the “Login using Email” button is loaded correctly or not.
- [x]  Widget Test if “Create Account” button is working correctly or not.

### Testing the functionality:

- [ ]  Unit test to check logout function.
- [ ]  Unit test to check social login function.

## Login Screen

![WhatsApp Image 2022-03-02 at 9.40.18 PM (1).jpeg](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/382940ec-32a9-41a0-990c-8c6712e48e70/WhatsApp_Image_2022-03-02_at_9.40.18_PM_(1).jpeg)

### Testing the Widgets:

- [x]  Widget Test if the “EMAIL” Textfield loaded correctly or not.
- [x]  Widget Test if the “PASSWORD” Textfield loaded correctly or not.
- [x]  Widget Test if the “Continue” button is loaded correctly or not.

### Testing the Functionality:

- [ ]  Unit test to check login function.
- [ ]  Unit test to check logout function.

#### **Documentation**: [Go to Notion](https://www.notion.so/rupi-app/MVP-FrontEnd-398d29c25f3c44a5a712076c6990c804)
