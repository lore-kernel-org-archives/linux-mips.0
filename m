Received: from mail-la0-f48.google.com ([209.85.215.48]:36367 "EHLO
        mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008992AbbFZXN1C8bFL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 27 Jun 2015 01:13:27 +0200
Date: Sat, 27 Jun 2015 02:13:35 +0300
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Message-ID: <1788792448.20150627021335@gmail.com>
Subject: Re: [tip:irq/urgent] MIPS/pci: Fix race in installing chained IRQ handler
In-Reply-To: <tip-746ad9a7a1fef789a9f579441b4a7b686fa85aa2@git.kernel.org>
References: <tip-746ad9a7a1fef789a9f579441b4a7b686fa85aa2@git.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <ryazanov.s.a@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, Julia.Lawall@lip6.fr, rmk+kernel@arm.linux.org.uk, ralf@linux-mips.org, mingo@kernel.org, hpa@zytor.com, wsa@the-dreams.de, linux-tip-commits@vger.kernel.org, Linux MIPS <linux-mips@linux-mips.org>
Message-ID: <20150626231335.iSPDkEEzoxRDg1Pv4xj7ax5-tSkUkr7Kc2yLYpDg7jY@z>

Hello Thomas,

Friday, June 26, 2015, 10:48:30 PM, you wrote:
> MIPS/pci: Fix race in installing chained IRQ handler

> Fix a race where a pending interrupt could be received and the handler
> called before the handler's data has been setup, by converting to
> irq_set_chained_handler_and_data().

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

Though  it's  nearly impossible to trigger a race here, since SoC boot
up with disabled PCI interrupts.

-- 
Sergey
