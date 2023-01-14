# Reflective.

## <ins>About</ins> <ins>The</ins> <ins>Project</ins>

The application intends to provide an aid in solving the **mass network of mental health issues faced by people living in India**, the target group of the project being **youngsters** and **adolescents** (high-school students and university students). The app notifies you to take a single **'<ins>candid</ins>'** snapshot of yourself once a day, at random times each day. The data collected overtime is stored in a database, and used for analytics:
1) To provide a clear and concise view of how your mental health has been over a period of time (say a month or two, or a year), the period being completely subjective. Data is presented to the user in easily understandable graphs and mental health cards, on a straightforward user interface.
2) The analytics module graphs/visualizes **temporal data** as soon as the user clicks his/her snapshot, depending on the emotion displayed by  the user at the time of day. It also generates **5 daily-tasks** for the user to complete, depending upon the users past mental health history, inclined towards **cognitive betterment** in the long run. 
3) **It is important to note that the application is not a social-media platform, and solely focuses on personal development and cognitive betterment of the user, and thus requires active participation from the user as well. Hence, benefits reaped completely depend on how true he/she is being to the MoodCheck algorithm, and whether the given data was in-fact, the users real emotion felt in that moment.**
4) The algorithm does not ensure immediate results, and would in-fact require atleast a month of data and regular task-completion from the user in order to visualize benefits in the long run.
5) __On extended use of the application, the user could additionally consult their nearest psychiatrist or therapist, and provide them with the analytics information collected by the app, thus being of service to their diagnosis of the user’s mental health issue, and thus ensuring faster benefits.__ 

## <ins>Application</ins> <ins>Modules</ins>

## <ins>Module</ins> <ins>1</ins>: <ins>Firebase</ins> <ins>Authentication</ins>
- Firebase authentication-services are used to log users into their account, or create a new one.
- Users are required to adhere to a one-time email verification scheme in order to activate their account, after which they just need to enter their email address and password to access it.
## <ins>Module</ins> <ins>2</ins>: <ins>Mood-Oriented</ins> <ins>Daily</ins> <ins>Task</ins> <ins>Generation</ins>
- The user would be presented with **5 daily-tasks**, which the user could aim at finishing by the end of the day, if he/she wants to truly receive any benefits from the app. 
- The tasks would be inclined towards subjects such as **<ins>socialization</ins>**, **<ins>human</ins> <ins>interaction</ins>** and **<ins>music</ins> <ins>for</ins> <ins>mental health</ins>, and are generated based upon the mental health history of the subject.**
## <ins>Module</ins> <ins>3</ins>: <ins>Artificial</ins> <ins>Neural</ins> <ins>Network</ins> ("<ins>MoodCheck</ins>" <ins>ANN</ins>)
- Tensorflow and Keras model integrated to Flutter, which uses OpenCV to collect landmark points/data points from the users face and hands, stores the data in NumPy arrays, and infers the emotion displayed by the user.
- Users are notified to use the module once a day, and the inferred information is then relayed over to the Firestore Storage for data visualization.
## <ins>Module</ins> <ins>4</ins>: <ins>Firebase</ins> <ins>Storage</ins> <ins>and</ins> <ins>Data-Visualization</ins> (<ins>Incomplete</ins>)
- User mood data and metadata, such as the **image captured**, **time-of-capture**, etc., are stored in Firestore Storage, and is used to visualize the emotions displayed by the user along with the respective metadata on different days and times. The data is visualized in **3 formats**:

  - A **pie-chart**, depicting how happy or unhappy the user has felt over a given period of time selected by the user.
  - **Mental health cards**, containing a brief description of the emotion displayed by the user on a selected day from a **psychological perspective**, and additional       information that the user might want to know about that specific emotion inferred by the MoodCheck model (example: classification between *<ins>slight-smile</ins>*,     *<ins>very-happy</ins>*, and *<ins>happy</ins>*)
  - **Time-series graphs**, a data-visualization technique to show the overall line graph of the mood displayed by the user on an average, each day since the user began   utilizing the application.

## <ins>Tech</ins> <ins>Stack</ins>
- **Application Development:** Dart/Flutter
- **User Authentication Services:** Google Firebase
- **Computer Vision:** OpenCV
- **Cloud Storage:** Google Firestore Storage
- **Artificial Neural Network (ANN):** Tensorflow (TFLite) and Keras
- **Data Collection:** NumPy

## <ins>Screenshots</ins> (<ins>Emulated-Display</ins> <ins>For</ins> <ins>Emotion-Recognition</ins> <ins>ANN</ins>):

![image](https://user-images.githubusercontent.com/75426551/212101284-f298cbfb-b4d2-4ecb-9b08-2e906e658c39.png)
![image](https://user-images.githubusercontent.com/75426551/212101423-6a7a5f92-e661-4b51-be0d-ca72ec4a43a4.png)
![image](https://user-images.githubusercontent.com/75426551/212101695-623a21fb-bfde-4d61-82b0-1091f6106d33.png)
