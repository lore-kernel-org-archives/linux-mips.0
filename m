From: "Robert Rusek" <robru@teknuts.com>
Subject: RE: Executing IRIX binary ?
Date: Mon, 27 May 2002 14:58:15 -0700
Message-ID: <001d01c205c9$9d8faf40$0a01a8c0@sohotower>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020527211513.GE32064@paradigm.rfc822.org>
Sender: owner-linux-mips@oss.sgi.com
To: flo@rfc822.org
Cc: 'Ralf Baechle' <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20020527215815.KfS1RCMIo2zoOlUhZ2IdPD77BgeFagewFFCdAGioK7o@z>

I have IRIX binary support turned on in the kernel.  I can copy over my
IRIX libs from my old IRIX partition (I just do not know which ones).  I
don't think I have the dynamic loader?  How would I check to see if I
have it?  If not where would I get it?  Sorry about all these newbie
questions it is just that I need to be able to run the IRIX version of
fronpage server extensions since MS does not provide the open source.

Thanks,
Robert.

      -----Original Message-----
      From: flo@rfc822.org [mailto:flo@rfc822.org] 
      Sent: Monday, May 27, 2002 2:15 PM
      To: Robert Rusek
      Cc: 'Ralf Baechle'; linux-mips@oss.sgi.com
      Subject: Re: Executing IRIX binary ?
      
      
      On Mon, May 27, 2002 at 01:32:43PM -0700, Robert Rusek wrote:
      > Ralf,
      > 
      > Looks like I have the kernal compiled with the IRIX 
      binary support.  
      > How do I go about executing the binaries?  When I try 
      to execute it 
      > tells me that the file is not found.
      
      Are you shure you have the dynamic loader + libc + other 
      libs of IRIX installed in your system ?
      
      Flo
      -- 
      Florian Lohoff                  flo@rfc822.org            
       +49-5201-669912
                              Heisenberg may have been here.
      
