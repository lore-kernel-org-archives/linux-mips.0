Message-ID: <012e01c29048$0551fee0$df0210ac@gv.com.tw>
From: "??" <kevin@gv.com.tw>
References: <20021118144212.A12262@linux-mips.org><00a901c28fc4$76ace700$df0210ac@gv.com.tw><20021119132922.A15266@linux-mips.org><20021119095444.C18134@mvista.com><1037729027.17678.112.camel@zeus.mvista.com> <20021120114930.117a78bb.yoichi_yuasa@montavista.co.jp>
Subject: Re: usb hotplug function with linux mips kernel
Date: Wed, 20 Nov 2002 11:50:51 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevin@gv.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Yoichi Yuasa <yoichi_yuasa@montavista.co.jp>
Cc: jsun@mvista.com, ralf@linux-mips.org, linux-mips@linux-mips.org, ppopov@mvista.com, Fang Li <fanky@gv.com.tw>
Message-ID: <20021120035051.aJEkek0qfrKS2rpqT4DT3RjPH52UDMSQa57JukR0mtY@z>

dear Yoichi,

thanks for your reply & patch
we are using kernel 2.4.18, after reading your patch,

we found there is no following section:
- if (usb_hub_port_debounce(hub, port)) {
-  err("connect-debounce failed, port %d disabled", port+1);
-  usb_hub_port_disable(hub, port);
-  return;
- }

but a following section: (mentioned redhat bug #23670)
>        /* Some low speed devices have problems with the quick delay, so */
>        /*  be a bit pessimistic with those devices. RHbug #23670 */
>       if (portstatus & USB_PORT_STAT_LOW_SPEED) {
>                wait_ms(400);
>                delay = HUB_LONG_RESET_TIME;
>        }

can we safely remove the above section?

best regards,

----- Original Message -----
From: "Yoichi Yuasa" <yoichi_yuasa@montavista.co.jp>
To: <kevin@gv.com.tw>
Cc: <jsun@mvista.com>; <ralf@linux-mips.org>; <linux-mips@linux-mips.org>;
<ppopov@mvista.com>
Sent: Wednesday, November 20, 2002 10:49 AM
Subject: Re: usb hotplug function with linux mips kernel


> Hi,
>
> On 19 Nov 2002 10:03:47 -0800
> Pete Popov <ppopov@mvista.com> wrote:
>
> > On Tue, 2002-11-19 at 09:54, Jun Sun wrote:
> > > On Tue, Nov 19, 2002 at 01:29:22PM +0100, Ralf Baechle wrote:
> > > > Hello double questionmark ;-)
> > > >
> > > > On Tue, Nov 19, 2002 at 08:09:07PM +0800, ?? wrote:
> > > >
> > > > > anyone successfully using usb hotplug function with linux mips
kernel?
> > > > >
> > > > >
http://marc.theaimsgroup.com/?l=linux-hotplug-devel&m=102954820511328&w=2
> > > >
> > > > There is nothing in the USB code that should be MIPS specific.
Despite
> > > > what Tom suspects everything is fine.  32-bit kernel symbols always
start
> > > > with 0xffffffff and the value of usbdevfs_cleanup is an artefact of
the
> > > > function having been discarded by the linker.
> > > >
> > >
> > > Additional info:
> > >
> > > USB has been working on MIPS for well over a year now.  There was a
problem
> > > early on due to non-coherent MIPS cache, but it was solved back then.
> > >
> > > We have been using USB on global span IVR successfully.
> >
> > ... among many other mips boards.
> >
> > > Maybe there are still some patches missing in linux-mips tree.  I will
> > > take a look later.
>
> I don't have a problem with current CVS tree(linux_2_4 tag) and a small
patch.
>
> I tested by the following system.
> Hot plug is fine.
>
> NEC VR4122(Eagle)
> USB OCHI Controller
> SanDisk SDDR-31
> 128MB CF
>
> I attached a small patch.
>
> Yoichi
