From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200205062206.g46M6ge17977@coplin09.mips.com>
Subject: Re: zsh on console
Date: Tue, 7 May 2002 00:06:42 +0200 (CEST)
In-Reply-To: <20020506121606.B28872@lucon.org> from "H . J . Lu" at May 06, 2002 12:16:06 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>
Cc: "Kevin D. Kissell" <kevink@mips.com>, Kjeld Borch Egevang <kjelde@mips.com>, linux-mips mailing list <linux-mips@oss.sgi.com>
Message-ID: <20020506220642.OGI8vmWO8Xc-MWycSN4I3qOdx74B1C9T_ZnGHvBKrVo@z>

H . J . Lu writes:
> 
> On Mon, May 06, 2002 at 02:57:28PM +0200, Kevin D. Kissell wrote:
> > > When I run zsh on the console (serial interface) the process hangs. I can 
> > > login with /bin/bash, but when I start /bin/zsh it waits forever. I can 
> > > interrupt the process and regain control.
> > > 
> > > It's only related to the console. If I login with telnet it works just 
> > > fine.
> > > 
> > > Any idea, what could be wrong?
> > 
> > I don't know what it would be specifically, but having
> > dealt with similar problems on other Unix systems,
> > it's proably the case that zsh uses a particular tty
> > mode that isn't correctly supported by the serial
> > console driver, either due to a bug in the driver or
> > due to a conflict with some other feature enabled
> > on the console port.  The next step to take would
> > be to run "stty -all" under /bin/bash and under
> > /bin/zsh on a telnet session, and compare the 
> > outputs.
> 
> That sounds like a zsh bug I fixed. Please try zsh 3.0.8-8.1 in my RedHat 7.1
> port and let me know if it doesn't work for you.

You only have the source RPM on OSS?
I believe we compiled from another SRC RPM: zsh-4.0.4-5.src.rpm. 

What was your fix? 

/Hartvig
