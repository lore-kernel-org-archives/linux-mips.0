Message-ID: <002501c1b9b8$a87addb0$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <000901c1b9b0$51cdd0b0$0f1610ac@delllaptop>
Subject: Re: Error Compiling 2.4.3 kernel on SGI IP22...
Date: Tue, 19 Feb 2002 21:45:11 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Robert Rusek <robru@teknuts.com>, linux-mips@oss.sgi.com
Message-ID: <20020220024511.mxQ65NT-53JwtKm7ylI8q37K66hkVvRGshiodCFAuMo@z>

Check your arch/mips/ld.script file.  I think you need to remove the
OUTPUT_FORMAT line in there.  This was fixed in CVS on May 10, 2001; your
snapshot might be right before that.

Regards,
Brad

----- Original Message -----
From: "Robert Rusek" <robru@teknuts.com>
To: <linux-mips@oss.sgi.com>
Sent: Tuesday, February 19, 2002 8:45 PM
Subject: Error Compiling 2.4.3 kernel on SGI IP22...


> make[1]: Entering directory `/usr/src/linux-2.4.3/arch/mips/kernel'
<snip>
> mips-linux-ld: target elf32-bigmips not found
> make: *** [vmlinux] Error 1
