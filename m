Message-ID: <00a301c18073$5d29a810$6401a8c0@autodesk.com>
From: "Garrick Evans" <sginux@yahoo.com>
References: <3C0CDB7B.C13AE2B3@mips.com> <20011204161157.A9410@galadriel.physik.uni-konstanz.de> <3C10A5CB.FB92B3A@mips.com> <3C10C526.56F65E57@mips.com>
Subject: Re: Mozilla/Netscape on MIPS
Date: Sat, 8 Dec 2001 21:35:51 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Carsten Langgaard <carstenl@mips.com>, Guido Guenther <agx@sigxcpu.org>, linux-mips@oss.sgi.com
Message-ID: <20011209053551.4SUm16kkyapTNPCdFalIHHOmE-Y9FEDCLIudPbZ3tpw@z>

this is a debug/test debug no? i mean it chews up RAM... got a thinner
version?

----- Original Message -----
From: "Carsten Langgaard" <carstenl@mips.com>
To: "Guido Guenther" <agx@sigxcpu.org>; <linux-mips@oss.sgi.com>
Sent: Friday, December 07, 2001 5:33 AM
Subject: Re: Mozilla/Netscape on MIPS


> Carsten Langgaard wrote:
>
> > Guido Guenther wrote:
> >
> > > On Tue, Dec 04, 2001 at 03:19:39PM +0100, Carsten Langgaard wrote:
> > > > There has previous been some request about running Mozilla on a MIPS
> > > > system.
> > > > We have put a bigendian and a littleendian image on our FTP site.
> > > >
> > > > It runs on the current RedHat7.1 distribution with some minor
updates.
> > > > The needed RPMs is also available on our FTP site:
> > > >     ftp://ftp.mips.com/pub/linux/mips/installation/apps/mozilla/
> > > Were any special patches needed? Could you please also put the source
> > > rpms there?
> >
> > Ok, I will put the sources on our FTP.
> > Inorder to build the sources you also need to install some extra RPMs
and
> > rebuild crtbeginS.o, crti.o and libc_nonshared.a with the -Wa,-xgot
option.
>
> It now on FTP, you will also find precompiled version of crtbeginS.o,
crti.o
> and libc_nonshared.a (compiled with -Wa,-xgot).
> Please read the README.build file for howto build the sources.
>
> The link are:
> ftp://ftp.mips.com/pub/linux/mips/installation/apps/mozilla/src/
>
> >
> > >
> > > Regards,
> > >  -- Guido


_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
