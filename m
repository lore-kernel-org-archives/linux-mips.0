Message-ID: <007001c1f940$ba95b0c0$011e1ec0@home>
From: "nsauzede" <nsauzede@online.fr>
References: <Pine.LNX.4.10.10205091055260.9983-100000@www.transvirtual.com>
Subject: Re: Debian on Indy.
Date: Sun, 12 May 2002 01:08:13 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: James Simmons <jsimmons@transvirtual.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020511230813.hN8pDO6h3fVSPP_6oOp7jae8_e64TLwl6fhMafb8g90@z>

> Okay. Got it to boot. Now it fails with a bunch of SCSI errors. After it
> complained it hanged. Any ideas or do you need th exact SCSI errors?


Just for info : I managed to have the Debian Woody to work fine on my Indy
(kernel is 2.4.13 if I remember well...)

But when I tried to boot some kernel 2.5.?? (can't remember last number -- I
fetched the source from CVS) I cross compiled on an i386 platform, I got the
same problem : bootup crashes at SCSI probing time...

Must be some kind of SCSI code regression or something..

I think I already posted my problem to the list but didn't get reply....

Nicolas Sauzede.
