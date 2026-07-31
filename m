Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160F3B3BE2
	for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497189; cv=pass; b=BR7xGOzr1I5gizOknfVwtDOoMNLlXO93ANII/eOgxp4NVj6V6/tqB5AtLFdUg+kHWbGbyT+X7sdi0rc7VucAC/A6cu8jQdHGquDAPrpo+nAwq44BmuA1idl/a/C8E+euSFMI6LX0siCoOHpeeILcemBR5LDJgwl+vi0bkkJj4TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497189; c=relaxed/simple;
	bh=eTKhNSmO7gOBXcxQpbQd8UaBpN703ks8yeJ8BPCpvBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loSQ3jOBvYI53B33VRhRoOGJBYhHV2XbdxGgyfLjW2AGI+dew5PcLgm2gUDU+xzAdYV+U8veI0wbqVBSkQSAdb9AXFaG1B4g1TobMRO3f19NE3Wd+ACS27Xq3Kk8VJV1JmUeD7W/OwOUaeBUj/i0tdQaNItoitV9grs2iuAwVPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geYE+6fx; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geYE+6fx"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so676306e87.1
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 04:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785497186; cv=none;
        d=google.com; s=arc-20260327;
        b=gCP2y+CH/Qqtwe+387Z4SvHo0PJdTi1se598GVT7FsIsvScgKVoJ4M3rcxIo1wDDSI
         vk0Ihq2NuObKzjca/ko1xCx3v7Pz4o90CdgPspaKqJHVVkC+qL57DNZhOtAVZHTOitHJ
         gIe98iUDxYviMZWelfp7boK5S+7FXaMhimFRAAosJ3pJ9jrS3UxJz0bHcLPGhifltB+r
         wlDlZPbgG925djcOOrCBkPM37QAX1X2l+AXXyjQfprdr5TGuptsknfQPqzMWoQJKT+b2
         OoXBqRw39VH6C7NRS7NJE88KBCZ12uQwUKe8RgWsbRuCIIMM6zxJDnkf7UoZV+7xEopc
         Eayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tx8QlJcUBeFKUO4djTB0Bjf2dRsxVemnqF1oCIfTdQU=;
        fh=pT34Oa9tP1bfKW78uHOFQOgfQd9dCcPtJlLp8Uuy5Eo=;
        b=CQ6N43ZLD/lpaqyDqbxYWAd8giJxGFFtTN5I6Vnee+9gwes+tG1hFqMEjqxwpYYFc0
         U7j9FznyqkMqEJMTaoWHyfwwBbieBchdOEbB7xctmk8jZdCgFqPAQx0nkPmhPwPeTqGZ
         j9QMYp9yFha87nH423Kv0t9u5MEco7aOHwMm9aGXtEWpmGxwB1k/M6d6jRdolNELdpd8
         Jg1Qf7maRwKSZVxZPl2mY7w0XGw1ybGuqjXWjDwHXsHoP9OYdbFIoAqAjFqhwKk/rarb
         kFooajMhI+t2BXfv8NqKi6LRwd6IUyiM31eoZ2stVZJp8BqsAx05K0AxKUFfDRpevX0E
         k9Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497186; x=1786101986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tx8QlJcUBeFKUO4djTB0Bjf2dRsxVemnqF1oCIfTdQU=;
        b=geYE+6fxxaDpeEDhQbZMv5PLEch5EBwvDNkieXoLTq/u4X0glsEp3tXe37oNm4h1iD
         iTXaw4UnX86qCNxvuP5F0XNVPozaLMGOIfgFfs8kpy5C1LIAVnSAklTktUn9CwxENyl6
         7oh5Tmx2Iu4mr8cwKK1Ok43s4fYw/nxfi3Azgmz2dGxYao+cnMDgPQ3TQ87KDL7CrxAJ
         sO3ju6iUIsLFsyXJ9kaKluCip5VcS7VirPITXA9Gv3UX6pky+XzhRIr0IjUHyoO1q8h7
         bpFZd6y1pLN/8JbonSOQhBNmDUOGK351FnNizkJ0y79yw78wBI34SS69XiuJ8LRAOBtw
         Z0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497186; x=1786101986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tx8QlJcUBeFKUO4djTB0Bjf2dRsxVemnqF1oCIfTdQU=;
        b=QE7QQUNntGScQhttKn1E4feSHmaAlUk8LG+GkSG+zz7N/EtOEt0Byai3RRAe0SZTFA
         TcnAM62oqpUTOM+clYnzY5nD2tit/XL+6pmuTuBWeDSJcNJucVCklGwpQeON38oZaDLL
         kvlr4yHjMwWlpGlTFpF3p/ZvVRx3RGWkHINz2Zti8G+pBQ7eh3eKEOZA+aMrNZrC1Tr1
         LXZCwifZ4PzFdcVcRizi0P8r6rb1XnSNAmB5xrCIHF/AWnqPAAefm8Bg07MvnbEw5NNM
         PCFA2vilDgn6TY1FfFu7DEiOn3TCxwXJgntynaK87jCSh562KLDBRZahQUmuvGlVEAyH
         RgDg==
X-Forwarded-Encrypted: i=1; AHgh+RrfRnh7OlvuWULyoGMAKb6NQuHkW+Sik7Crgsd+aEz1C/9wkOvb8MZeGdZcYh25AeqF03QPz0FqNNOo@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKeF+BS4+DSmXhtnik8rEGL/JteG9xhOPtJQSgT0Uwr2/WH9X
	40J+LpeCI4Qcm/irujpfn53+Mn5dwjfSns2HuN0qiOhRb6kKx/NYeLtapR8kpilzQc6ucm3YZqY
	PKTPISJZkouC9Bs0LOzYjOsjLf/dW6w8=
X-Gm-Gg: AR+sD13Fm6fG6G7GSkvM4SC2Uqel5Axuh0vtdyoa9+U06XO0hG99Smru36G555dORui
	feFRAlLrQyURx6FsZ7DyhXRVIutymR2jsaHFd8DhAaVXpikWHglkraRgyNUicuhHTDPEU8TPqcn
	uJGBprVND8BL3DA2l7tkEM/EzydrCCF+KxlYP16frbI7raNYR89s3BQKdQJ3pli2wBeUY40flzv
	hq+oNapCzGxsDXQcgrlSwxB4tY+30vEfM2j9PvAGMQJdlxcfyejNmALaXFlfiphNE05bk8chrXX
	1m6Fn6fVQf0WoJgquPwZfAwvKF/h9HEmRT0Gg9PcBgIWwUXtUjZSGHC9lDK+w7VNM7PyLvOqC3F
	7ElwGzRrLAJSjz/ptn/43yEmEkr2lG9M=
X-Received: by 2002:a05:6512:6682:10b0:5b2:a6eb:ff2f with SMTP id
 2adb3069b0e04-5b2e1ffbdf2mr237156e87.43.1785497185537; Fri, 31 Jul 2026
 04:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com> <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 31 Jul 2026 19:25:48 +0800
X-Gm-Features: AUfX_mzeKDuWFGB9-QtB9UDZLLYc_PvBaCNo0Mab9h8W0ZtRXMgM0NnGrF6YPSQ
Message-ID: <CAJhJPsUmpie6NkrzuTK-8C4NP2FFKQMG3nY8626_C9Qjdu4M0g@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Wed, Jul 29, 2026 at 10:32=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> ls1x_dma_tx_status() locates the descriptor actively being processed by
> walking the LLI list and comparing the hardware reported next descriptor
> pointer against each element's next-descriptor pointer.
>
> A list_for_each_entry macro is used in the comparison phase. Which at
> the end of the loop leaves the lli pointer at the currently executing LLI=
.
> However this also subsequently runs for a non-match lli, in which it
> points at the head. This causes a type confusion bug which treats the
> head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
> goes forwards and prints garbage via the dev_dbg.
>
> Fix the type confusion bug by only allowing matched LLI descriptor chains
> to print the current LLI and residue calculation, as failing to match
> should be treated as an unexpected condition.
>
> Found by the following Coccinelle check:
>
>   scripts/coccinelle/iterators/use_after_iter.cocci
>
>   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
>   reference to the index variable of the iterator on line 450
>
> I did not see a bug upstream detailing this error, nor do I have the
> hardware to confirm this bug or error, all this is from a pure code
> examination.
>
> As I do not possess the hardware, I cannot test the patch. Compile tested
> only with mips64-linux-gnu-gcc.
>
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> ---
>
> v2:
> - encapsulate residue calculation and dev_dbg inside the
>   list_for_each_entry() macro. Treat non-matching LLI as an unexpected
>   case.
>
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd20ab..8658d5377795 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -446,22 +446,27 @@ static enum dma_status ls1x_dma_tx_status(struct dm=
a_chan *dchan,
>
>                         /* locate the current lli */
>                         next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEX=
T];
> -                       list_for_each_entry(lli, &desc->lli_list, node)
> -                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D nex=
t_phys)
> -                                       break;
> +                       list_for_each_entry(lli, &desc->lli_list, node) {
> +                               if (lli->hw[LS1X_DMADESC_NEXT] !=3D next_=
phys)
> +                                       continue;
>
> -                       dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad=
",
> -                               &lli->phys);
> +                               dev_dbg(chan2dev(dchan), "current lli_phy=
s=3D%pad\n",
> +                                       &lli->phys);
>
> -                       /* count the residues */
> -                       list_for_each_entry_from(lli, &desc->lli_list, no=
de)
> -                               bytes +=3D lli->hw[LS1X_DMADESC_LENGTH] *
> -                                        chan->bus_width;
> +                               /* count the residues */
> +                               list_for_each_entry_from(lli, &desc->lli_=
list, node)
> +                                       bytes +=3D lli->hw[LS1X_DMADESC_L=
ENGTH] *
> +                                                chan->bus_width;
> +
> +                               dma_set_residue(state, bytes);
> +                               return status;
> +                       }
> +
> +                       dev_warn(chan2dev(dchan),
> +                                "unable to locate current lli.\n");
>                 }
>         }
>
> -       dma_set_residue(state, bytes);
> -
>         return status;
>  }
>
> --
> 2.54.0
>


--=20
Best regards,

Keguang Zhang
