# Univoicity

- Univoicity is a Flutter based mobile app designed to empower university students by providing them with a platform to propose, discuss, and vote on campus-specific rules and policies. 
- The app functions similarly to social media platforms like Twitter, but with a focus on democratic engagement within educational institutions. 
- Students can submit proposals, participate in discussions, and vote on issues relevant to their campus community. 


## Features

- **Login Page:** Sign in using VTOP credentials.
- **Home Page:** View overall ratings, majority votings, like/dislike statistics, and navigate to posts or create new ones.
- **Posts Page:** Browse campus rules/policies with upvote/downvote counts.
- **New Post Page:** Generate random campus-specific rules or policies using Gemini AI.

## Getting Started

1. **Install Flutter:**  
   [Flutter installation guide](https://docs.flutter.dev/get-started/install)

2. **Clone the repository:**  
   ```sh
   git clone <(https://github.com/Sanjanesh/Univoicity.git)>
   cd Univoicity
   ```
3. **Install dependencies:**  
   ```sh
   flutter pub get
   ```

4. **Configure Gemini AI:**
    - In main.dart, replace 'ENTER YOUR GEMINI AI MODEL HERE' and 'ENTER YOUR KEY HERE' with your Gemini API model and key.

5. **Run the app:**  
   ```sh
   flutter run
   ```