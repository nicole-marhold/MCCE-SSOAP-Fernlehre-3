# MCCE-SSOAP-Fernlehre-3 // Secure Cloud Application
from Christoph Marchhart and Nicole Marhold

## Aufgabenstellung 
Ziel: bereitgestellte Microservice Applikation (Potatohead) absichern 
- Verbesserung der Ausfallsicherheit 
- Secrets 
- Transportverschlüsselung 
- Authentifizierung 
- Supply Chain 
- Observability

## Ausfallsicherheit 
Um die Ausfallsicherheit zu verbessern wurden zum einen zum Zweck der Skalierung der Verfügbarkeit in zwei unterschiedlichen Regionen mit AWS Auto Scaling implementiert und zum anderen ein AWS Elastic Load Balancer installiert damit die Applikation aus Endkundensicht über eine einzige Virtuelle IP-Adresse angesprochen werden kann und die Anzahl der Worker-Instanzen nicht transparent ist. 

## HTTPs 
Es wurde versucht mittels AWS Elastic Load Balancer die Applikation per HTTPs bzw. Port 443 bereitzustellen. Leider besteht mit dem Studentenkonto der FH-Burgenland keine Möglichkeit im AWS Certificate Manager ein Zertifikat anzufordern.   
![Bild1](https://user-images.githubusercontent.com/61579665/153617107-feb898f7-7d79-47f9-8395-6d7a85ece361.png)

Ein zuvor generiertes SSL-Zertifikat kann leider auch nicht importiert werden:
![Bild2](https://user-images.githubusercontent.com/61579665/153617171-52420fff-8b25-414c-95f9-d9147e3dbc4d.png)
![Bild3](https://user-images.githubusercontent.com/61579665/153617226-1088d149-cbee-4d9a-99d2-f86f733107bb.png)


## Vulnerability Scanner 
Um Vulnerabilities in den Images der Docker-Container der Applikation erkennen zu können, wurden auf den Instanzen der Open-Source Vulnerability-Scanner Trivy mitinstalliert. Zur besseren Veranschaulichung haben wir das nun so umgesetzt, uns ist natürlich bewusst, dass wir das im Normalfall in unsere CD/CI-Pipeline integrieren müssen.
![Bild4](https://user-images.githubusercontent.com/61579665/153617282-73228d96-8391-4a2d-906e-75df7b4afa4b.png)

## OAuth 
Aus unserer Sicht funktioniert IaC in Kombination mit OAuth nicht ohne manuelle Konfiguration, da sich die IP-Adressen und der DNS-Hostname bei jeden Deployment über Terraform ändert. Dahingehend müsste man nach jedem Deployment eine neue App in Github registrieren. 
