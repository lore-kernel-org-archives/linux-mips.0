From: "Robert Rusek" <robru@teknuts.com>
Subject: RE: Executing IRIX binary ?
Date: Sun, 26 May 2002 09:34:50 -0700
Message-ID: <000701c204d3$47c94ae0$0a01a8c0@sohotower>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020525154426.A2481@dea.linux-mips.net>
Sender: owner-linux-mips@oss.sgi.com
To: 'Ralf Baechle' <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020526163450.qxC3hwMlPnoDhyfMbZ6zxE-qxVLaNKh5u8ju1D1h7jk@z>

This may be a stupid question but which IRIX libraries?  All of them?
When I try to execute a IRIX biniary I get the following:

bash: ./owsadm: No such file or directory

Do I need to something special?

Thanks,
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
      
