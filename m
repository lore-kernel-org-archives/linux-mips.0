Received: from mailapp01.imgtec.com ([195.59.15.196]:5507 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012028AbcBHRFog-QTP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 8 Feb 2016 18:05:44 +0100
Date: Mon, 8 Feb 2016 17:05:37 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v3 2/3] crash_dump: Add vmcore_elf32_check_arch
In-Reply-To: <1454946278-13859-3-git-send-email-daniel.wagner@bmw-carit.de>
Message-ID: <alpine.DEB.2.00.1602081705150.15885@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1602061624460.15885@tp.orcam.me.uk> <1454946278-13859-1-git-send-email-daniel.wagner@bmw-carit.de> <1454946278-13859-3-git-send-email-daniel.wagner@bmw-carit.de>
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
Message-ID: <20160208170537.OlcpMk4vaTWZiV7gdKBIWONlU-mQcErj_XiqGqtP1TE@z>

On Mon, 8 Feb 2016, Daniel Wagner wrote:

> parse_crash_elf{32|64}_headers will check the headers via the
> elf_check_arch respectively vmcore_elf64_check_arch macro.
> 
> The MIPS architecture implements those two macros differently.
> In order to make the differentiation more explicit, let's introduce
> an vmcore_elf32_check_arch to allow the archs to overwrite it.
> 
> Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
> Suggested-by: Maciej W. Rozycki <macro@imgtec.com>
> ---

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej
