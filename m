Received: from perches-mx.perches.com ([206.117.179.246]:56938 "EHLO
        labridge.com" rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org
        with ESMTP id S6818712Ab3FTSSrgaMFf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Jun 2013 20:18:47 +0200
Message-ID: <1371752324.2146.25.camel@joe-AO722>
Subject: Re: Re: [PATCH] gpio MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
From: Joe Perches <joe@perches.com>
Date: Thu, 20 Jun 2013 11:18:44 -0700
In-Reply-To: <51C34584.8070301@gmail.com>
References: <1371251915-18271-1-git-send-email-ddaney.cavm@gmail.com>
         <CACRpkdYHzBBbPNujYRGkMFGuQRzeYKs9jgfc3e3HWyxQFahvRQ@mail.gmail.com>
         <51C34584.8070301@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <joe@perches.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, David Daney <david.daney@cavium.com>
Message-ID: <20130620181844.yq4-m65ysr_oOZLgK7KMrA3OqnRqU3TQrLVxS54B9NA@z>

On Thu, 2013-06-20 at 11:10 -0700, David Daney wrote:
> Sorry for not responding earlier, but my e-mail system seems to have 
> malfunctioned with respect to this message...
[]
> On 06/17/2013 01:51 AM, Linus Walleij wrote:
> >> +static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
> >> +{
> >> +       struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
> >> +       u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
> >> +
> >> +       return ((1ull << offset) & read_bits) != 0;
> >
> > A common idiom we use for this is:
> >
> > return !!(read_bits & (1ull << offset));
> 
> I hate that idiom, but if its use is a condition of accepting the patch, 
> I will change it.

Or use an even more common idiom and change the
function to return bool and let the compiler do it.
