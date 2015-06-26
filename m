Received: from mail-la0-f45.google.com ([209.85.215.45]:35857 "EHLO
        mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009529AbbFZXQVYZtpL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 27 Jun 2015 01:16:21 +0200
Date: Sat, 27 Jun 2015 02:16:30 +0300
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Message-ID: <441261391.20150627021630@gmail.com>
Subject: Re: [tip:irq/urgent] MIPS/ath25: Fix race in installing chained IRQ handler
In-Reply-To: <tip-08ece35e7dcc24591e27089029f1fea14e76d1fa@git.kernel.org>
References: <tip-08ece35e7dcc24591e27089029f1fea14e76d1fa@git.kernel.org>
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
Cc: rmk+kernel@arm.linux.org.uk, ralf@linux-mips.org, linux-kernel@vger.kernel.org, mingo@kernel.org, Julia.Lawall@lip6.fr, hpa@zytor.com, linux-tip-commits@vger.kernel.org, Linux MIPS <linux-mips@linux-mips.org>
Message-ID: <20150626231630.OpIWfpw39Q3hBKEnhFt1SDtAoKw_DeMBRPI2FxwuM4c@z>

Hello Thomas,

Friday, June 26, 2015, 10:48:13 PM, you wrote:
> MIPS/ath25: Fix race in installing chained IRQ handler

> Fix a race where a pending interrupt could be received and the handler
> called before the handler's data has been setup, by converting to
> irq_set_chained_handler_and_data().

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

-- 
Sergey
