Message-ID: <20011106215824.52382.qmail@web11908.mail.yahoo.com>
Date: Tue, 6 Nov 2001 13:58:24 -0800 (PST)
From: Wayne Gowcher <wgowcher@yahoo.com>
Subject: _MIPS_SIM and others not defined by specs file warning
In-Reply-To: <1005012474.27128.306.camel@zeus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips <linux-mips@oss.sgi.com>
Message-ID: <20011106215824.GWS4ONU76jv9zXjR9QgquavvHHV49TFJeuEh3BSc90E@z>

I am attempting to compile X using egcs-2.91.66 and I
am getting the following warnings which eventually
lead to the build failing.

 #warning "Macro _MIPS_ISA has not been defined by
specs file"
../../../../config/makedepend/makedepend: warning: 
vga.c: 24: #warning "Macro _MIPS_SIM has not been
defined by specs file"
../../../../config/makedepend/makedepend: warning: 
vga.c: 28: #warning "Macro _MIPS_SZINT has not been
defined by specs file"
../../../../config/makedepend/makedepend: warning: 
vga.c: 32: #warning "Macro _MIPS_SZLONG has not been
defined by specs file"
../../../../config/makedepend/makedepend: warning: 
vga.c: 36: #warning "Macro _MIPS_SZPTR has not been
defined by specs file"
../../../../config/makedepend/makedepend: warning: 
vga.c: 44: #warning "Please update your GCC to GCC
2.7.2-4 or newer"

I have previously successfully compiled X using
egcs-2.90.29.

Could someone tell me what I may be doing wrong ?
Or what I need to pas into the compiler in order for
it to read the specs file correctly.

Would also be grateful if someone could point to me a
document or something explaining what the specs file
is and how it is used. By looking at it, I figure it
to be a file that sets integer lengths, procesor type
etc. But it sure would be nice to get a bigger picture
explanation.

TIA

Wayne

__________________________________________________
Do You Yahoo!?
Find a job, post your resume.
http://careers.yahoo.com
