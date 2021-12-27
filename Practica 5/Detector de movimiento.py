import numpy as np
import cv2
 
# Capturamos el vídeo
cap = cv2.VideoCapture('Video.mp4')
 
# Llamada al método
fgbg = cv2.createBackgroundSubtractorKNN(history=60, dist2Threshold=200, detectShadows=False)
cv2.ocl.setUseOpenCL(False)
 
while(1):
	# Leemos el siguiente frame
	ret, frame = cap.read()
 	# Si hemos llegado al final del vídeo salimos
	if not ret:
		break
 	# Aplicamos el algoritmo
	fgmask = fgbg.apply(frame)
 
	# Copiamos el umbral para detectar los contornos
	contornosimg = fgmask.copy()
 	# Buscamos contorno en la imagen
	contornos, _ = cv2.findContours(contornosimg, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
 
	# Recorremos todos los contornos encontrados
	for c in contornos:
		if cv2.contourArea(c) < 500:
			continue
 
		# Obtenemos el bounds del contorno, el rectángulo mayor que engloba al contorno
		(x, y, w, h) = cv2.boundingRect(c)
		cv2.rectangle(frame, (x, y), (x + w, y + h), (-1, 255, 0), 2)
 
	# Mostramos las capturas
	cv2.imshow('Camara',frame)
	cv2.imshow('Umbral',fgmask)
	cv2.imshow('Contornos',contornosimg)
	k = cv2.waitKey(30) & 0xff
	if k == ord("s"):
		break
cap.release()
cv2.destroyAllWindows()
