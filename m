Received: from mail-bl2on0085.outbound.protection.outlook.com ([65.55.169.85]:36733
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010888AbcBKRfUsvWsV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 11 Feb 2016 18:35:20 +0100
Message-ID: <56BCC64A.5040902@caviumnetworks.com>
Date: Thu, 11 Feb 2016 09:35:06 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/3] MIPS: OCTEON: Rename legacy properties in internal
 device trees.
References: <1455207976-2262-1-git-send-email-matt.redfearn@imgtec.com> <1455207976-2262-2-git-send-email-matt.redfearn@imgtec.com> <56BCB7AE.2050901@gmail.com> <56BCBC90.6090805@imgtec.com>
In-Reply-To: <56BCBC90.6090805@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, david.daney@cavium.com, aleksey.makarov@caviumnetworks.com, ulf.hansson@linaro.org, robh@kernel.org, ralf@linux-mips.org, linux-mmc@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Message-ID: <20160211173506.Q1TfxwIHUyyHWfJJtHqatuwIwkuY5FGZEOX76eKLsB8@z>

On 02/11/2016 08:53 AM, Matt Redfearn wrote:
> Hi David,
>
> On 11/02/16 16:32, David Daney wrote:
>> On 02/11/2016 08:26 AM, Matt Redfearn wrote:
>>> Many OCTEON devices have been shipped in products with fixed DTBs. These
>>> DTBS contain properties which are not compatible with newer kernels with
>>> upstream drivers.
>>> Therefore some mechanism is necessary to convert legacy naming into
>>> upstream naming. In the first instance this is to support the OCTEON MMC
>>> controller, which is in a later patch of this series.
>>> This patch adds a octeon_handle_legacy_device_tree() function which is
>>> always called from device_tree_init() to fix up the device tree so that
>>> drivers need have no knowledge of the legacy naming or properties.
>>>
>>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>>
>> NAK...
>>
>> I already sent e-mail on this, but it crossed in flight.
>
> Yeah, unfortunate timing.
>
>>
>> Basically, this patch is much more complex than the original code
>> which was just a few lines to check the alternate "legacy" names.
>
> This code is functionally equivalent to the previous version, just
> located in platform code rather than the driver itself.

I know, one thing I really don't like about it, is that we are modifying 
the kernel's view of the device that was passed in.  How does that 
effect what is seen in /sys/firmware ?

I would rather see code that calls mmc_of_parse(), and then, if the two 
properties in question (bus-width, and max-frequency) have not been 
filled in, attempt to read them with the legacy names using 
of_property_read_u32()

The implementation of mmc_of_parse() already contains support for 
parsing legacy properties, so we could also add a couple more there, 
which would be the simplest change of all.


> In terms of LOC
> it's not much different. Doing it this was does allow future flexibility
> to change other bindings that are fixed in firmware without having to
> support each set in the individual drivers.

I think the controversy is limited to the MMC driver.  As far as I know, 
we are in good shape with the bindings for the other drivers.


> Leaving this patch out will mean having to get any legacy bindings
> accepted into each driver via their maintainer.
> But for the moment we're just talking about the MMC driver - if this
> patch is not accepted then the only way to support legacy devices is
> with Ulf's signoff of handling both binding versions in the driver.
>
[...]
