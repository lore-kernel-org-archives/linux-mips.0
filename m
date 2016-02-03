Received: from mailapp01.imgtec.com ([195.59.15.196]:2410 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011756AbcBCMYpiUp2E (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 13:24:45 +0100
Date: Wed, 3 Feb 2016 12:24:38 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 1/5] MIPS: Bail on unsupported module relocs
In-Reply-To: <1454471085-20963-2-git-send-email-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1602031139250.15885@tp.orcam.me.uk>
References: <1454471085-20963-1-git-send-email-paul.burton@imgtec.com> <1454471085-20963-2-git-send-email-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Andrey Konovalov <adech.fo@gmail.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20160203122438.95HGoliS_0SIqtOO7uBI8aFEo36d9ghDAwFN70dpCXs@z>

On Wed, 3 Feb 2016, Paul Burton wrote:

> --- a/arch/mips/kernel/module-rela.c
> +++ b/arch/mips/kernel/module-rela.c
> @@ -134,9 +135,21 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  			return -ENOENT;
>  		}
>  
> -		v = sym->st_value + rel[i].r_addend;
> +		type = ELF_MIPS_R_TYPE(rel[i]);
> +
> +		if (type < ARRAY_SIZE(reloc_handlers_rela))
> +			handler = reloc_handlers_rela[type];
> +		else
> +			handler = NULL;
>  
> -		res = reloc_handlers_rela[ELF_MIPS_R_TYPE(rel[i])](me, location, v);
> +		if (!handler) {
> +			pr_warn("%s: Unknown relocation type %u\n",
> +				me->name, type);
> +			return -EINVAL;

 Hmm, this looks like a fatal error condition to me, the module won't 
load.  Why `pr_warn' rather than `pr_err' then?  Likewise in the other 
file.

  Maciej
