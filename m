Message-ID: <002501c26400$b7fc0640$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <008801c2639f$385b1b80$10eca8c0@grendel> <20020924103703.P14312@mvista.com>
Subject: Re: FCSR Management
Date: Tue, 24 Sep 2002 21:29:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20020924192925.bjIFdmKfKdtSSyAvWbL69a5kV6eA1Z0lSL-9B556mFo@z>

From: "Jun Sun" <jsun@mvista.com>
> > Am I missing something, or is this a problem?
> >
> 
> FPE exceptions, actually almost all exceptions, are cleared before their
> handlers are invoked.  See kernel/entry.S and look for BUILD_HANDLER().
> 
> Those macro defines are really mind-twisting and usually don't show up on
> grep radar...

Right you are.  Thanks.  Maciej gave me a bit of a scare there. ;-)
In an ideal universe, the unmodified FCSR which is correctly 
passed as a parameter to handle_fpe() (now that I look at entry.S,
it all comes back.. ;-) would be passed on as part of the
signal "payload" if SIGFPE is caught, but at least things
aren't drastically broken.

            Kevin K.
