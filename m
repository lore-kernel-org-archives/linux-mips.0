From: "Robert Rusek" <robru@teknuts.com>
Subject: RE: Executing IRIX binary ?
Date: Mon, 27 May 2002 13:32:43 -0700
Message-ID: <000701c205bd$adaeff40$0a01a8c0@sohotower>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020525154426.A2481@dea.linux-mips.net>
Sender: owner-linux-mips@oss.sgi.com
To: 'Ralf Baechle' <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020527203243.Je6QoXA12LjZZH5fAdsgYsR_MZ6Yag0BaspjE6Vdlus@z>

Ralf,

Looks like I have the kernal compiled with the IRIX binary support.  How
do I go about executing the binaries?  When I try to execute it tells me
that the file is not found.

Thanks in advance,
Robert.

      -----Original Message-----
      From: owner-linux-mips@oss.sgi.com 
      [mailto:owner-linux-mips@oss.sgi.com] On Behalf Of Ralf Baechle
      Sent: Saturday, May 25, 2002 3:44 PM
      To: robru
      Cc: linux-mips@oss.sgi.com
      Subject: Re: Executing IRIX binary ?
      
      
      On Sat, May 25, 2002 at 12:06:29PM -0700, robru wrote:
      
      > How can I find out if I compiled my kernel with the 
      compatibility 
      > code?
      
      Make sure you have CONFIG_BINFMT_IRIX set in the kernel 
      configuration.
      
      You'll also need to install IRIX libraries.
      
        Ralf
      
