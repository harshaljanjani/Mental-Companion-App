import mediapipe as mp 
import numpy as np 
import cv2

def data_collection():
	cap = cv2.VideoCapture(0)
	instanceName = input("Enter name for data-store: ")
	#holistic-tracking
	holistic = mp.solutions.holistic
	hands = mp.solutions.hands
	rgbDatapoints = holistic.Holistic()
	drawing = mp.solutions.drawing_utils
	dataSet = []
	dataSize = 0
	while True:
		row = []
		ret, frame = cap.read()
		frame = cv2.flip(frame, 1) #lateral flip
		datapts = rgbDatapoints.process(cv2.cvtColor(frame, cv2.COLOR_BGR2RGB))  
		if datapts.face_landmarks:
			if not(datapts.left_hand_landmarks):
				for i in range(42):
					row.append(0.0)
			else:
				for i in datapts.left_hand_landmarks.landmark:
					#choose 8 as the reference point instead of 0.0
					row.append(i.x - datapts.left_hand_landmarks.landmark[8].x)
					row.append(i.y - datapts.left_hand_landmarks.landmark[8].y)
			if not(datapts.right_hand_landmarks):
				for i in range(42): #if not in frame
					row.append(0.0)
			else:
				for i in datapts.right_hand_landmarks.landmark:
					#choose 8 as the reference point instead of 0.0
					row.append(i.x - datapts.right_hand_landmarks.landmark[8].x)
					row.append(i.y - datapts.right_hand_landmarks.landmark[8].y)

			for i in datapts.face_landmarks.landmark:
				#choose 1 as the reference point instead of 0.0
				row.append((i.x - datapts.face_landmarks.landmark[1].x))
				row.append((i.y - datapts.face_landmarks.landmark[1].y))

			dataSize += 1
			dataSet.append(row)

		drawing.draw_landmarks(frame, datapts.face_landmarks, holistic.FACEMESH_CONTOURS)
		drawing.draw_landmarks(frame, datapts.left_hand_landmarks, hands.HAND_CONNECTIONS)
		drawing.draw_landmarks(frame, datapts.right_hand_landmarks, hands.HAND_CONNECTIONS)
		
		cv2.putText(frame, str(dataSize), (50,50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0,255,0),2)
		cv2.imshow("window", frame)
		if cv2.waitKey(1) == 27 or dataSize > 99: #esc-key is pressed->exit / collected 100
			cap.release()
			cv2.destroyAllWindows()
			break

	dataSet = np.array(dataSet)
	print("="*50)
	print(dataSet.shape)
	print(dataSet[0])
	#save list data in numpy file:
	np.save(instanceName+".npy", dataSet)