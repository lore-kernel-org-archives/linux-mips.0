Date: Fri, 12 Oct 2001 22:54:33 -0700
From: "H . J . Lu" <hjl@lucon.org>
Subject: Re: Big endian problem
Message-ID: <20011012225433.A10523@lucon.org>
References: <APEOLACBIPNAFKJDDFIIIEBLCBAA.hli@quicklogic.com> <3BC72CCC.3604FEC8@mvista.com> <3BC74EFE.9020109@quicklogic.com> <20011012173552.B3689@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20011012173552.B3689@mvista.com>; from jsun@mvista.com on Fri, Oct 12, 2001 at 05:35:52PM -0700
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Dan Aizenstros <dan@quicklogic.com>, Hanks Li <hli@quicklogic.com>, linux-mips@oss.sgi.com
Message-ID: <20011013055433.uaU3UjcfxBk_16rGKFFI_tD_cQzXc4KorF3_qn0-spU@z>

On Fri, Oct 12, 2001 at 05:35:52PM -0700, Jun Sun wrote:
> On Fri, Oct 12, 2001 at 04:13:50PM -0400, Dan Aizenstros wrote:
> > Hello Jun,
> > 
> > The file is the common time.c from linux/arch/mips/kernel as you
> > can see from the third to last line of Hanshi's email.  The tools
> > he is using are from H. J. Lu's RedHat 7.1 RPMs on the oss.sgi.com
> > ftp site.  The file compiles just fine with the little endian version
> > of the same tools from the same place.
> > 
> > Hanshi and I will look at the USECS_PER_JIFFY_FRAC macro.  Thanks for
> > the pointer.
> > 
> > -- Dan A.
> >
> 
> It is indeed a strange problem as it only shows up in BE tools.  
> Some tool gurus want to look into it?
> 
> Meanwhile the following patch seems to fix it (and a couple of other
> time.c files)
> 
> Jun 

This is what I sent out in July.


H.J.
----
