Received: from barrett ([209.49.110.172])
	by emma.patton.com (8.9.0/8.9.0) with SMTP id OAA06751
	for <linux-mips@linux-mips.org>; Tue, 27 May 2003 14:44:17 -0400 (EDT)
From: "Brad Barrett" <brad@patton.com>
Subject: "relocation truncated to fit"
Date: Tue, 27 May 2003 14:44:16 -0400
Message-ID: <BBEBJGNKIDPPHNAJKDFHAECPCJAA.brad@patton.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@patton.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "'Linux-Mips@Linux-Mips. Org'" <linux-mips@linux-mips.org>
Message-ID: <20030527184416.dtwbWzxopZS998OPkghGIcmMVlDPtJ6jZSQyrbqaUvs@z>

Preface:
--------
I have a userspace toolchain issue.  I'm not sure where to post it, so I'll
start here.  I know some toolchain people are on this list.  If there's a more
appropriate mailing list someone let me know.

Synopsis:
---------
I am cross-compiling (on x86) the GNU Gatekeeper using "homebuilt" GNU
mipsel-linux tools.  For those not familiar with Gatekeeper there are three
parts.  Two libraries: pwlib and openh323, and then a gatekeeper client called
openh323gk which links to both libraries.

I am able to build pwlib completely--both static and shared versions of both the
debug and regular libraries.  I can build static versions of both debug and
regular openh323, but when linking the shared versions I get relocation
truncation errors (details below).  If try to build the openh323gk client using
either of the static openh323 libs that I was able to create, I get the same
kinds of relocation truncation errors at link time.

Details:
--------
Here is the link step that fails from the openh323 library build:

mipsel-linux-g++ -shared -Wl,-soname,libh323_linux_mips_r.so.1 -o
/home/brad/openh323/lib/libh323_linux_mips_r.so.1.11.7 -s -fPIC -L/home/brad/pwl
ib/lib -L/home/brad/openh323/lib -lpthread
/home/brad/openh323/lib/obj_linux_mips_r/h225_1.o  [... continues with 169 other
.o files]

The error output is thousands of the following:
/home/brad/openh323/lib/obj_linux_mips_r/h235.o(.gnu.linkonce.t._ZNK14H235_ENCRY
PTEDI27H235_EncodedKeySyncMaterialE5CloneEv+0x98): In function
`H235_ENCRYPTED<H235_EncodedKeySyncMaterial>::Clone() const': : relocation
truncated to fit: R_MIPS_GOT16 vtable for
H235_ENCRYPTED<H235_EncodedKeySyncMaterial>
/home/brad/openh323/lib/obj_linux_mips_r/h235.o(.gnu.linkonce.t._ZNK14H235_ENCRY
PTEDI27H235_EncodedKeySyncMaterialE5CloneEv+0xb0): In function
`H235_ENCRYPTED<H235_EncodedKeySyncMaterial>::Clone() const': : relocation
truncated to fit: R_MIPS_CALL16
PASN_ObjectId::PASN_ObjectId[in-charge](PASN_ObjectId const&)
/home/brad/openh323/lib/obj_linux_mips_r/h235.o(.gnu.linkonce.t._ZNK14H235_ENCRY
PTEDI27H235_EncodedKeySyncMaterialE5CloneEv+0xd0): In function
`H235_ENCRYPTED<H235_EncodedKeySyncMaterial>::Clone() const': : relocation
truncated to fit: R_MIPS_CALL16 H235_Params::H235_Params[in-charge](H235_Params
const&)
[...]

I built the cross-tools myself.  They are now about 6-8 months old.  They
consist of:
- gcc version 3.2.1 20020903 (prerelease)
- GNU ld version 2.13.90.0.10 20021010  [from H.J. Lu]
- glibc version 2.2.5

What I know:
------------
Googling hasn't turn up much, with the exception of an intriguing exchange from
Sept 2001  on this mailing list:

Petter Reinholdtsen reports similar messages when (native) compiling "a huge C++
program" (actually Opera) on an Indy:
http://www.spinics.net/lists/mips/msg04568.html

Wilbern Cobb suggests using -G4, -G2, or -G1, which Petter reports reduces the
messages but does not eliminate them.  Then Ryan Murray says that every static
library used in the link, including libc_noshared.a and libgcc.a, must be
compiled with -Wa,xgot.  H.J. Lu appears to think it's an -fpic vs -fPIC issue
(which from my level of understanding seems very plausible).  Most interesting
of all is that Ryan notes that this issue is *known* to affect Openh323.
http://www.spinics.net/lists/mips/msg04575.html

There is no follow up post from Petter, so how he resolved the issue is unknown.
