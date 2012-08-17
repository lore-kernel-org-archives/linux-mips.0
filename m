Received: from mail-gh0-f177.google.com ([209.85.160.177]:39792 "EHLO
        mail-gh0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903609Ab2HQVqr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Aug 2012 23:46:47 +0200
Received: by ghbf20 with SMTP id f20so4723004ghb.36
        for <linux-mips@linux-mips.org>; Fri, 17 Aug 2012 14:46:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120817213247.GA1056@avionic-0098.mockup.avionic-design.de>
References: <502E8115.90507@gmail.com> <CAErSpo7a77wAxrgZYfg_UdqLEtEf0wUxcbxTghnR7HbRsncKRQ@mail.gmail.com>
 <20120817182931.GA27391@avionic-0098.adnet.avionic-design.de>
 <CAErSpo6xhbpmd-rnLqKp9SuRQCp5a7jUzKhz0n6zGGLNHybWqA@mail.gmail.com>
 <20120817200755.GA16021@avionic-0098.adnet.avionic-design.de>
 <CAErSpo4XX7mQBmJfYWzmXCSDAt4BzZoJV6gU9__409K=fpvC6A@mail.gmail.com>
 <20120817204839.GA2017@avionic-0098.mockup.avionic-design.de>
 <20120817210718.GA14842@avionic-0098.mockup.avionic-design.de>
 <CAErSpo7bwHNUchZHeJByxzhsc0uN7RJMLivBo5FuOJzA0Gz2Jg@mail.gmail.com> <20120817213247.GA1056@avionic-0098.mockup.avionic-design.de>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Fri, 17 Aug 2012 15:46:20 -0600
Message-ID: <CAErSpo7D8HSKQ7o9peWBE6e30UcYOBj8KTEENzyxhTNKSUmYWg@mail.gmail.com>
Subject: Re: PCI Section mismatch error in linux-next.
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-pci@vger.kernel.org, linux-mips <linux-mips@linux-mips.org>
Message-ID: <20120817214620.0N23K2MFxUH2ulJ2sHIahdl0lPdnYNoNuMhzySFl9N4@z>

On Fri, Aug 17, 2012 at 3:32 PM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> On Fri, Aug 17, 2012 at 03:25:22PM -0600, Bjorn Helgaas wrote:
>> On Fri, Aug 17, 2012 at 3:07 PM, Thierry Reding
>> <thierry.reding@avionic-design.de> wrote:
>> > On Fri, Aug 17, 2012 at 10:48:39PM +0200, Thierry Reding wrote:
>> >> On Fri, Aug 17, 2012 at 02:39:34PM -0600, Bjorn Helgaas wrote:
>> > [...]
>> >> > Well, maybe you just need to turn on CONFIG_HOTPLUG.  How would that
>> >> > affect you?  I think we would still have to change some __inits to
>> >> > __devinit, including pcibios_update_irq(), but it might be more
>> >> > manageable.
>> >>
>> >> You said that depending on HOTPLUG wouldn't be enough because it would
>> >> exclude reenumeration at runtime if HOTPLUG wasn't defined. Also it is
>> >> theoretically possible to build a kernel without HOTPLUG but have the
>> >> enumeration start after init because of deferred probing. Those cases
>> >> won't work if we keep __init or __devinit respectively, right?
>> >
>> > Another possibility would be to make PCI select HOTPLUG or depend on it.
>> > That way it would be made sure that __devinit wouldn't cause all the
>> > functions to be discarded after init.
>>
>> There's been some discussion recently about whether CONFIG_HOTPLUG is
>> worth keeping any more, but nothing's been resolved yet.  If we did
>> decide to remove CONFIG_HOTPLUG, or require it for PCI, I would rather
>> just remove all the __devinit annotations because they'd be
>> superfluous.
>
> I've missed that discussion. Can you point me to it?

Sure: http://lists.linux-foundation.org/pipermail/ksummit-2012-discuss/2012-June/000051.html

From previous email:
>> This is the situation (deferred probing with CONFIG_HOTPLUG=n) that
>> I'm suggesting might not need to work.  After all, hotplug essentially
>> means "adding devices after init."

> Yes, I guess that would be appropriate. However I don't see how this
> could be expressed in Kconfig unless the deferred probing itself is
> conditionalized on HOTPLUG. Even in that case it would still be possible
> to build a PCIe controller driver as a module and load it at runtime
> after init.

That's exactly it -- the deferred probing and any loadable PCI host
bridge drivers would have to depend on HOTPLUG.  That seems like the
most straightforward, least-surprises, approach for now.

Bjorn
