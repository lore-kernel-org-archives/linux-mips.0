Received: from mail-pa0-f48.google.com ([209.85.220.48]:45127 "EHLO
        mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010722AbaJGP510SCKb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Oct 2014 17:57:27 +0200
Received: by mail-pa0-f48.google.com with SMTP id eu11so7353055pac.35
        for <linux-mips@linux-mips.org>; Tue, 07 Oct 2014 08:57:21 -0700 (PDT)
Date: Tue, 7 Oct 2014 08:57:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 07/44] qnap-poweroff: Drop reference to pm_power_off from
 devicetree bindings
Message-ID: <20141007155713.GB28835@roeck-us.net>
References: <1412659726-29957-1-git-send-email-linux@roeck-us.net>
 <1412659726-29957-8-git-send-email-linux@roeck-us.net>
 <20141007110219.GE24725@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141007110219.GE24725@leverpostej>
Return-Path: <groeck7@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lguest@lists.ozlabs.org" <lguest@lists.ozlabs.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-am33-list@redhat.com" <linux-am33-list@redhat.com>, "linux-cris-kernel@axis.com" <linux-cris-kernel@axis.com>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-m32r-ja@ml.linux-m32r.org" <linux-m32r-ja@ml.linux-m32r.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, "user-mode-linux-devel@lists.sourceforge.net" <user-mode-linux-devel@lists.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "linux-metag@vger.kernel.org" <linux-metag@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>
Message-ID: <20141007155713.i_tZVD2EEh118PsCxw2YzFKdpwzqkEsTn4QW3h72a3E@z>

On Tue, Oct 07, 2014 at 12:02:19PM +0100, Mark Rutland wrote:
> On Tue, Oct 07, 2014 at 06:28:09AM +0100, Guenter Roeck wrote:
> > Replace reference to pm_power_off (which is an implementation detail)
> > and replace it with a more generic description of the driver's functionality.
> > 
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Pawel Moll <pawel.moll@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt b/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt
> > index af25e77..1e2260a 100644
> > --- a/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt
> > +++ b/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt
> > @@ -3,8 +3,8 @@
> >  QNAP NAS devices have a microcontroller controlling the main power
> >  supply. This microcontroller is connected to UART1 of the Kirkwood and
> >  Orion5x SoCs. Sending the character 'A', at 19200 baud, tells the
> > -microcontroller to turn the power off. This driver adds a handler to
> > -pm_power_off which is called to turn the power off.
> > +microcontroller to turn the power off. This driver installs a handler
> > +to power off the system.
> 
> I'd remove the last sentence -- the driver is also independent of the
> HW, and the description of how the power off works at the HW level is
> sufficient.
> 
Done.

> With that:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
Thanks!

Guenter
