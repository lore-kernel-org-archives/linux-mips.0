Received: from mailapp01.imgtec.com ([195.59.15.196]:23620 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855389AbaHTKE6WhlIy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Aug 2014 12:04:58 +0200
Message-ID: <53F472C2.2030202@imgtec.com>
Date: Wed, 20 Aug 2014 11:04:50 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: define _MIPS_ARCH_LOONGSON3A for Loongson3
References: <1408504488-12319-1-git-send-email-chenj@lemote.com> <1408504488-12319-2-git-send-email-chenj@lemote.com>
In-Reply-To: <1408504488-12319-2-git-send-email-chenj@lemote.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: chenj <chenj@lemote.com>, linux-mips@linux-mips.org
Cc: chenhc@lemote.com, ralf@linux-mips.org
Message-ID: <20140820100450.SpI98MnTpOQ0hY65bOfWW_tT44O0koY00-Rw7HL4RLE@z>

Hi,

On 20/08/14 04:14, chenj wrote:
> diff --git a/arch/mips/loongson/Platform b/arch/mips/loongson/Platform
> index 0ac20eb..5f527d1 100644
> --- a/arch/mips/loongson/Platform
> +++ b/arch/mips/loongson/Platform
> @@ -22,6 +22,9 @@ ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
>    endif
>  endif
>  
> +# Define _MIPS_ARCH_LOONGSON3A for Loongson3
> +cflags-$(CONFIG_CPU_LOONGSON3)  += -D_MIPS_ARCH_LOONGSON3A

Any reason not to just refer directly to CONFIG_CPU_LOONGSON3 from the
source rather than adding an intermediate definition?

Cheers
James
