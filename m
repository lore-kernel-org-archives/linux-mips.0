Received: from mailapp01.imgtec.com ([195.59.15.196]:2785 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012049AbcBHRChHxzeP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 8 Feb 2016 18:02:37 +0100
Date: Mon, 8 Feb 2016 16:58:29 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v3 3/3] mips: Differentiate between 32 and 64 bit ELF
 header
In-Reply-To: <1454946278-13859-4-git-send-email-daniel.wagner@bmw-carit.de>
Message-ID: <alpine.DEB.2.00.1602081657000.15885@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1602061624460.15885@tp.orcam.me.uk> <1454946278-13859-1-git-send-email-daniel.wagner@bmw-carit.de> <1454946278-13859-4-git-send-email-daniel.wagner@bmw-carit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160208165829.qj54oG58hX559SjVY6vHXCzfGGXOUoegXXBoTUpUt-4@z>

On Mon, 8 Feb 2016, Daniel Wagner wrote:

> Therefore, we rather define vmcore_elf{32|64}_check_arch() as a
> basic machine check and use it also in binfm_elf?32.c as well.
> 
> Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
> Suggested-by: Maciej W. Rozycki <macro@imgtec.com>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> ---

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej
