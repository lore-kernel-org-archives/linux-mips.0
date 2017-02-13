Received: from mail.kernel.org ([198.145.29.136]:37426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993877AbdBMWpXB9-67 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 13 Feb 2017 23:45:23 +0100
Date: Mon, 13 Feb 2017 16:45:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 12/12] MIPS: PCI: Fix IP27 for the PCI_PROBE_ONLY case
Message-ID: <20170213224512.GA8080@bhelgaas-glaptop.roam.corp.google.com>
References: <20170207061356.8270-1-kumba@gentoo.org>
 <20170207061356.8270-13-kumba@gentoo.org>
 <CAErSpo6yKAE1_c1eZJapnjD1g0pocyOxed3_Eumdp_026uhDuA@mail.gmail.com>
 <eafc94c6-1931-e2ce-7e03-d84d8e181e81@gentoo.org>
 <CAErSpo4LsrPCtdZwp6CyT0jKhXLt3j=fGSiFjpRRTPUjFoKHtQ@mail.gmail.com>
 <c7ed6a1d-f625-d294-8910-dd2d93d34292@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7ed6a1d-f625-d294-8910-dd2d93d34292@gentoo.org>
Return-Path: <helgaas@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joshua Kinard <kumba@gentoo.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linux/MIPS <linux-mips@linux-mips.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Message-ID: <20170213224512.VRYrgjCiFHjbE5q1Z8xloyEAxHhK_VZom5h3BYtOh10@z>

It looks like IP30 is using some code that's not upstream yet, so I'll
just point out some things that don't look right.  I'm ignoring the
IP27 stuff here in case that has different issues.

Joshua wrote:
> On 02/07/2017 13:29, Bjorn Helgaas wrote:
>> Is there any chance you can collect complete dmesg logs and
>> /proc/iomem contents from IP27 and IP30?  Maybe "lspci -vv" output,
>> too?  I'm not sure where to look to understand the ioremap() behavior.
> 
> ...
> A note about IP30, since that's part of an external patch set, the
> dmesg output is a little different, as it is using the newer
> BRIDGE/Xtalk code I just sent in as patches.  ...
> 
> Also, IP30 doesn't use the PCI_PROBE_ONLY thing anymore.  This causes
> /proc/iomem to be far more detailed than it used to be.
> 
> IP30's /proc/iomem:
>     00000000-00003fff : reserved
>     1d200000-1d9fffff : Bridge MEM
>       d080000000-d080003fff : 0001:00:03.0
>       1d204000-1d204fff : 0001:00:02.0
>       1d205000-1d205fff : 0001:00:02.1
>       1d206000-1d206fff : 0001:00:02.2
>       1d207000-1d2070ff : 0001:00:02.3
>       1d207100-1d20717f : 0001:00:01.0
>     1f200000-1f9fffff : Bridge MEM
>       f080100000-f0801fffff : 0000:00:02.0
>       f080010000-f08001ffff : 0000:00:00.0
>       f080030000-f08003ffff : 0000:00:01.0
>       f080000000-f080000fff : 0000:00:00.0
>       f080020000-f080020fff : 0000:00:01.0
>     20004000-209b8fff : reserved
>       20004000-206acb13 : Kernel code
>       206acb14-208affff : Kernel data
>     209b9000-20efffff : System RAM
>     20f00000-20ffffff : System RAM
>     21000000-9fffffff : System RAM
>     f080100000-f0801fffff : ioc3
