# Deploy aplicație Spring Boot în Kubernetes cu Minikube (Windows)

## 1. Pornește Minikube
```powershell```
minikube start (docker desktop sa fie pornit)

## 2. Construiește imaginea direct în Minikube (NU folosi Docker Desktop)
```powershell```
minikube image build -t demo-docker:`versiune`.
#### ```deployment.yaml``` de modificat versiunea
      containers:
        - name: demo-docker
          image: demo-docker:`versiune`
          imagePullPolicy: Never
          ports:
            - containerPort: 8080

## 3. Aplică fișierele Kubernetes
```powershell```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

## 4. Verifică statusul
```powershell```
kubectl get pods
kubectl get svc

## 5. Accesează aplicația
```powershell```
minikube service demo-docker-service

