Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0ypWIG-000aOoC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: possible driver error?
Date: Fri, 26 Jun 1998 12:03:48 +0100 (BST)
In-Reply-To: <19980626184731.09737@life.nthu.edu.tw> from "Francis M.J. Hsieh" at Jun 26, 98 06:47:31 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "Francis M.J. Hsieh" <mjhsieh@life.nthu.edu.tw>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980626110348.7vN3KhOSvrSPDrtyLKhZZxTTOKnG7wOK4OaFcrHsFjc@z>

>   Here is a possible driver error (but seems harmless, I checked it
>   using network managerment hardware, no transmission error occured)

I think someone is shipping old ifconfig tools with Linux/SGI. See if
"cat /proc/net/dev" makes sense
