Content-Type: text/plain;
  charset="iso-8859-1"
From: Russell Coker <russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Subject: Re: broken devfs-support in SGI Zilog8530 serial driver
Date: Fri, 29 Mar 2002 14:38:35 +0100
References: <20020329103244.GA15765@bunny.shuttle.de> <000001c1d711$2492f070$1fc1f2a3@mow.siemens.ru> <20020329132650.GA16905@bunny.shuttle.de>
In-Reply-To: <20020329132650.GA16905@bunny.shuttle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20020329133836.377B1237BB@lyta.coker.com.au>
Sender: owner-linux-mips@oss.sgi.com
To: Raoul Borenius <raoul@shuttle.de>, Borsenkow Andrej <Andrej.Borsenkow@mow.siemens.ru>
Cc: linux-mips@oss.sgi.com, devfs@oss.sgi.com
Message-ID: <20020329133835.1BtvTYCJrIhDn1WqsOtyyCaRlKqOh82PO1egHV9gMWY@z>

You need some code similar to the following in the serial driver:

#ifdef CONFIG_DEVFS_FS
        serial_driver.name = "tts/%d";
#else
        serial_driver.name = "ttyS";
#endif

Of course if the original device nodes were named /dev/ttyZ0 etc then you 
want "tts/Z%d".

Look at the Cyclades and Stallion drivers for examples of it being done 
correctly.  Or tell me exactly the details of what you want and I'll send you 
a patch.

-- 
If you send email to me or to a mailing list that I use which has >4 lines
of legalistic junk at the end then you are specifically authorizing me to do
whatever I wish with the message and all other messages from your domain, by
posting the message you agree that your long legalistic sig is void.
