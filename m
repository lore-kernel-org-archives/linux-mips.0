Received: from mail-cys01nam02on0078.outbound.protection.outlook.com ([104.47.37.78]:35950
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992212AbcJYOpTLi6eh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 25 Oct 2016 16:45:19 +0200
Date: Tue, 25 Oct 2016 07:44:59 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Patch v5 04/12] irqchip: xilinx: Add support for parent intc
Message-ID: <20161025144459.GF14444@xsjsorenbubuntu>
References: <1476723176-39891-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1476723176-39891-5-git-send-email-Zubair.Kakakhel@imgtec.com>
 <32f5f17d-7864-c782-7a6f-03660b7ab055@arm.com>
 <581adf44-388c-f8e5-8437-59d7ace2fa8f@imgtec.com>
 <alpine.DEB.2.20.1610251246020.4990@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.20.1610251246020.4990@nanos>
Return-Path: <soren.brinkmann@xilinx.com>
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
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Marc Zyngier <marc.zyngier@arm.com>, monstr@monstr.eu, ralf@linux-mips.org, jason@lakedaemon.net, alistair@popple.id.au, mporter@kernel.crashing.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, michal.simek@xilinx.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulus@samba.org, benh@kernel.crashing.org
Message-ID: <20161025144459.XMez0oB6bYJXauXxb10n2EmzT7XdUzUDouYyO6uDuY0@z>

On Tue, 2016-10-25 at 12:49:33 +0200, Thomas Gleixner wrote:
> On Tue, 25 Oct 2016, Zubair Lutfullah Kakakhel wrote:
> > On 10/21/2016 10:48 AM, Marc Zyngier wrote:
> > > Shouldn't you return an error if irq is zero?
> > > 
> > 
> > I'll add the following for the error case
> > 
> > 	pr_err("%s: Parent exists but interrupts property not defined\n" ,
> > __func__);
> 
> Please do not use this silly __func__ stuff. It's not giving any value to
> the printout.
> 
> Set a proper prefix for your pr_* stuff, so the string is prefixed with
> 'irq-xilinx:' or whatever you think is appropriate. Then the string itself
> is good enough to find from which place this printk comes.

Haven't looked at the real code, but is there probably a way to get a
struct device pointer and use dev_err?

	Sören
