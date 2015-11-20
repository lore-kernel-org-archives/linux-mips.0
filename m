Received: from mailapp01.imgtec.com ([195.59.15.196]:16104 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012943AbbKTKs1jw5TP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Nov 2015 11:48:27 +0100
Subject: Re: [PATCH 10/14] irqchip/mips-gic: Add a IPI hierarchy domain
References: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
 <1446549181-31788-11-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1511071323471.4032@nanos> <56407F3C.4060404@imgtec.com>
 <alpine.DEB.2.11.1511161610070.3761@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <564EFA74.90606@imgtec.com>
Date: Fri, 20 Nov 2015 10:48:20 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1511161610070.3761@nanos>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20151120104820.TjqS4ZCsR3CzJC50IRf6jZy0XmXpwFjoyuTZcXopf0I@z>

Hi Thomas,

On 11/16/2015 05:17 PM, Thomas Gleixner wrote:
> 1) IPI as per_cpu interrupts
>
>     Single hwirq represented by a single irq descriptor
>
> 2) IPI with consecutive mapping space
>
>     No extra mapping from virq base to target cpu required as its just
>     linear. Everything can be handled via the base virq.
>


I think I am seeing a major issue with this approach.

Take the case where we reserve an IPI with ipi_mask that has cpu 5 and 6 
set only. When allocating a per_cpu or consectuve mapping, we will 
require 2 consecutive virqs and hwirqs. But since the cpu location is 
not starting from 0, we can't use the cpu as an offset anymore.

So when a user wants to send an IPI to cpu 6 only, the code can't easily 
tell what's the correct offset from base virq or hwirq to use.

Same applies when doing the reverse mapping.

In other words, the ipi_mask won't always necessarily be linear to 
facilitate the 1:1 mapping that this approach assumes.

It is a solvable problem, but I think we're losing the elegance that 
promoted going into this direction and I think sticking to using struct 
ipi_mapping (with some enhancements to how it's exposed an integrated 
by/into generic code) is a better approach.

Thoughts?

I still don't have a working implementation otherwise I would have sent 
my patches, but I thought I'd raise this up before I spend more time on 
it unnecessarily.

Thanks,
Qais
