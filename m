Date: Mon, 23 Jul 2001 20:56:56 +0100 (IST)
From: Dave Airlie <airlied@csn.ul.ie>
Subject: Re: about serial console problem
In-Reply-To: <995898583.1139.2.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.32.0107232056140.22712-100000@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Marc Karasek <marc_karasek@ivivity.com>
Cc: Barry Wu <wqb123@yahoo.com>, linux-mips@oss.sgi.com
Message-ID: <20010723195656.Y6Vt5ly2NhseiL9xDlkdqItw8aMg8cMAoeXw-2v3Qtk@z>


Cool, this patch fixed a problem we were seeing with busybox on the
Linux/VAX project, that I hadn't time to look at...

thanks

Dave.


On 23 Jul 2001, Marc Karasek wrote:

> This sounds like a problem I ran into on another processor/platform.
> What are you using for a ramdisk?  Is it busybox?  There was a bug in
> 0.51 busybox that would not let it accept input from a console on a
> serial port.  It had to do with the init for the serial port.  You can
> check the patch file below to see the problem that was in busybox...
>
> --- init.c.orig Sat Apr 21 17:46:57 2001
> +++ init.c      Sat Apr 21 17:46:31 2001
> @@ -276,7 +276,7 @@
>
>         /* Make it be sane */
>         tty.c_cflag &= CBAUD|CBAUDEX|CSIZE|CSTOPB|PARENB|PARODD;
> -       tty.c_cflag |= HUPCL|CLOCAL;
> +       tty.c_cflag |= CREAD|HUPCL|CLOCAL;
>
>         /* input modes */
>         tty.c_iflag = ICRNL | IXON | IXOFF;
>
> On 22 Jul 2001 23:51:25 -0700, Barry Wu wrote:
> >
> > Hi, all,
> >
> > I am porting linux 2.4.3 to our mipsel evaluation
> > board. Now I meet a problem. Because I use edown
> > to download the linux kernel to evaluation board.
> > I update the serial baud rate to 115200.
> > I use serial 0 as our console, and I can use
> > printk to print debug messages on serial port.
> > But after kernel call /sbin/init, I can not
> > see "INIT ...  ..." messages on serial port.
> > I suppose perhaps I make some mistakes. But when
> > I use 2.2.12 kernel, it ok.
> > If someone knows, please help me. Thanks!
> >
> > Barry
> >
> > __________________________________________________
> > Do You Yahoo!?
> > Make international calls for as low as $.04/minute with Yahoo! Messenger
> > http://phonecard.yahoo.com/
> --
> /*************************
> Marc Karasek
> Sr. Firmware Engineer
> iVivity Inc.
> marc_karasek@ivivity.com
> (770) 986-8925
> (770) 986-8926 Fax
> *************************/
>
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied@skynet.ie
pam_smb / Linux DecStation / Linux VAX / ILUG person
