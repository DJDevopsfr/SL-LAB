Your mission ...

1. Containerize the devops-pipeline.sh application so it works for us all

Hints:
The original developer said he has running the latest version of alpine Linux
and that he had to install a package called "figlet" with command " apk add --no-cache bash figlet"

When you got it built, push it to YOUR dockerhub account and provide your image uri in chat, so I (and everyone else) can pull it and run it on my machine!



Expected output once properly containerized ...


=== STARTING CI/CD PIPELINE ===

 ____ _____  _    ____ _____   _     ____  _   _ ___ _     ____
/ ___|_   _|/ \  / ___| ____| / |_  | __ )| | | |_ _| |   |  _ \
\___ \ | | / _ \| |  _|  _|   | (_) |  _ \| | | || || |   | | | |
 ___) || |/ ___ \ |_| | |___  | |_  | |_) | |_| || || |___| |_| |
|____/ |_/_/   \_\____|_____| |_(_) |____/ \___/|___|_____|____/

Compiling application source code...
Artifact app.tar.gz created successfully.

 ____ _____  _    ____ _____   ____      _____ _____ ____ _____
/ ___|_   _|/ \  / ___| ____| |___ \ _  |_   _| ____/ ___|_   _|
\___ \ | | / _ \| |  _|  _|     __) (_)   | | |  _| \___ \ | |
 ___) || |/ ___ \ |_| | |___   / __/ _    | | | |___ ___) || |
|____/ |_/_/   \_\____|_____| |_____(_)   |_| |_____|____/ |_|

Running unit tests...
All 100 tests passed

 ____ _____  _    ____ _____   _____    ____  _____ ____  _     _____   __
/ ___|_   _|/ \  / ___| ____| |___ /_  |  _ \| ____|  _ \| |   / _ \ \ / /
\___ \ | | / _ \| |  _|  _|     |_ (_) | | | |  _| | |_) | |  | | | \ V /
 ___) || |/ ___ \ |_| | |___   ___) |  | |_| | |___|  __/| |__| |_| || |
|____/ |_/_/   \_\____|_____| |____(_) |____/|_____|_|   |_____\___/ |_|

Pushing application to AWS production cluster...
Deployment complete!

