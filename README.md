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

Ein zuvor generiertes SSL-Zertifikat kann leider auch nicht importiert werden:


## Vulnerability Scanner 
Um Vulnerabilities in den Images der Docker-Container der Applikation erkennen zu können, wurden auf den Instanzen der Open-Source Vulnerability-Scanner Trivy mitinstalliert. Zur besseren Veranschaulichung haben wir das nun so umgesetzt, uns ist natürlich bewusst, dass wir das im Normalfall in unsere CD/CI-Pipeline integrieren müssen.

## OAuth 
Aus unserer Sicht funktioniert IaC in Kombination mit OAuth nicht ohne manuelle Konfiguration, da sich die IP-Adressen und der DNS-Hostname bei jeden Deployment über Terraform ändert. Dahingehend müsste man nach jedem Deployment eine neue App in Github registrieren. 
