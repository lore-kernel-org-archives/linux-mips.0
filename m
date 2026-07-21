Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB5740960D
	for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619180; cv=pass; b=iDObItJrgfpIwS+i1Y4zPLHEbEb9sjo0PpHVYj1LM7/c2qTVw5snhY+ZroAqtXZ6zQuwahUtRGLGsfQYNNjTMveU9JrT4UPL1k4MoQ2XEKCPVBgYO0cwpZj62wo+zazuZ14SkISseoNzu9X+a6S5Y97VAtxYbeSbNtIPzaZiaH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619180; c=relaxed/simple;
	bh=0CChg2Zb5gvOp1ImzkoIk799nOEo9CcxWjq6XbKoBpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCvgPdFD1fDp68M06alCc8302kZowq/3A+JbkXFq4UWyOd+YO3UyV+mnFihemUGUcO3YtyzlkKpC6232lZWq+UFc1A+TUGbTeqQojyv4vIIV7XsTdQHemtInwMYGY8IlA0zohN7U/FPA+T/rZeV7x34GUrqFbtLgDs0xornWn6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9pxgdBC; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9pxgdBC"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so99305571fa.2
        for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 00:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784619177; cv=none;
        d=google.com; s=arc-20260327;
        b=iwseLANUvqf0TdjoNWS/9VW2T4BhdX1HY9jB4iO21KPkQqI3iHd0xzKmGsApFPAB/l
         Oqb4y6TWpD+2BejuXOVSvM7HWpAkUyV8ktF7vd58DKpRxnSIVNtXyvzG8tWfVPr2hybv
         lw2fMqInw00clStFHXmIAk9f8Agr6Ceb6HbJ7cw3/XAp7SVASZKdc0YgzpYtm2n7/p+Y
         e1aKIrTEzDvjIpfyepPLBV2cFwC2q/DS95Tk8sldkJXfDtvs9CO17n3gmJorn/RHuHA/
         ubu0PQ4jLPm6bokFE2+8qGvauKQ4T4uaHmmoMJyOb3pOVRzyAfb5v8DAz5lQowDfJfTc
         bonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8o+RAe0niZAElELakupe2TNV2APmi2bhtI/BI8Bs84=;
        fh=z0fm2jDL2UtYRZ2iy8CC09zEvFkaRs/vIW2g4ael0Fo=;
        b=Ab2Ug6x/RMn2eMuCGthJqm2KZ4SguVxDmNhGkLdKAGVBG0JOztixXmyhJz/38xEB9n
         WyywtnGPp9Vnt2LfQCg7on9mOkSVwj5AI14pW/f6pCvUGq9Ss6oySMjWJ+WTaOrYt1/L
         iUXzZYVzwy9Rp9qtL/T3dalzc3esB/VDNbZ4QMpM9tvyQaM+Wptuz4aFDRaEfJS9K+OS
         RDp1M590hKNaKFYQH7DR/oJmFMMYicCI19yO4YV8CSFSC6t+BjV0aYG6bQu7SXj4rhTf
         RIv7NWYVCpZQQcjPeQp9Jl/hhv0U6or7xvX+6TXoumryC8k/CbrBF6rZa+xvtLDc7hFO
         +KIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784619177; x=1785223977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8o+RAe0niZAElELakupe2TNV2APmi2bhtI/BI8Bs84=;
        b=e9pxgdBCro6ocluiu5ViwvkZMMAFtfxCN20GJIFlbfk8xo25/JR7DOTveRyBz+CoKQ
         +SKP+tBS8rT7hY131kmorS6qx2EAe5hVFRmM/UK2+1trQdeJDQsoJZKXBzGvR5Gk5vX+
         9nM0ACRqv9fsQSOIbmT1uaTV1QEO4PFQ7gNRjIC4Ec1+u6L4+FXRl0SwqY8fwWFgA2Fj
         y6p7kmht8e+BkoGy7BiAMwaQkWM1ZZcptu4hwU3BFqIu8m1lxAP0ugENsPRKFbwEg/7R
         X/cQ1BgGYb7rAyubcz/EIL/QDFgmTdXkZyD4zXSZzk5sDpbU/MiZtgxriDLBPG51gjN0
         9uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619177; x=1785223977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8o+RAe0niZAElELakupe2TNV2APmi2bhtI/BI8Bs84=;
        b=FF5hO140esirD1tWjTTIfR+x2EAPEEoCgIRV1WdOhpkYvQ49QBdQsfzhi/BWNSmwwU
         R9qiZCO/v5fGaphVqtMGR1UjjT3kqihKUF6iZEc5b4llHxWIBwMxDbNTtKKgszt+rifz
         QxdAgdnY3ZjtOMm39mP5jGdctC3cW1fVrb/SOhUWh/nuoCJA42yiT7l4XSAMJQjjCI0b
         mIdEMxJpPxsWt8PLJKVG+C7nkC+o2ab6HcW3Tpa+CkNEVpoajR01jmaDeQwVsHhUWhQD
         bZMaPm0VJAKSRn3xovafnOaulkDvffQFz432SeOeBJWPgWjNcrQ4OS0Ybk32Yd+lm5hZ
         fYow==
X-Forwarded-Encrypted: i=1; AHgh+RrKAN3xN/APEvUDFXumkLJ0+JDXNDn3JIlp4zxm6uL4VcVlYYboGfE2WcXdSOMMlcB0Um65070NG0Lz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfu5bOnm0m/fJ69/DJfGJOb08Iln5gfsurUTv329xieCW0phmU
	+9iH135/6r/aB0pQp4mCVlzaVgBauwd7NNLxi+DSdGXC9n/zlG/Ox41XbY12TLC0E8sHkthk9Hv
	NpPgTUaU5bc0iA/woushm807kBBt4y+g=
X-Gm-Gg: AR+sD11NSRa7nqU93F5HbbyMIYeMw39xITEl8rxAp1vCtgRJV7CLfwcs4qUF3z1NO3l
	N8us5rI8ZpEw67aKubFhNzsxYd1eJ3NOOF4kIyeBh5rCW82cXpZNW1sdE1m+TlVtfRssKSTi41O
	UdeRFHU+FeEcCx9TY12EdJ7B8M4HOm614XcsC/xpv+pBvVDYbexS5g1YUxG/PyFpIk79p6+tN/q
	OZHx1q/vNAgS0IJdW+e3AGhjCu9muOEIMnlhWbUaC812HYk7oaV6an2CF3UNc50DmySV+/x4Zn4
	XimGQgQAItzRwdiexVPuzxdFrKjZ5gYjPur8jNy71otaeucq
X-Received: by 2002:a05:6512:1543:20b0:5b0:1433:13b9 with SMTP id
 2adb3069b0e04-5b28f880702mr2439566e87.25.1784619176459; Tue, 21 Jul 2026
 00:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 21 Jul 2026 15:32:19 +0800
X-Gm-Features: AUfX_myATwUZEeTvJp4nyV2ynsqaaPWg3tbxcSDpGX1RQHgXD6rcBP3NojFEJVA
Message-ID: <CAJhJPsVj=pntghpDvzwcNj4hm-7Uu0bD+Uy-4b3Okw5Sq__JQw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: loongson1-apb-dma: fix residue calculation for
 queued descriptors
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mahad,

Thanks for catching this use-after-iterator issue.

On Mon, Jul 20, 2026 at 10:25=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> ls1x_dma_tx_status() locates the descriptor actively being processed by
> walking the LLI list and comparing the hardware reported next descriptor
> pointer against each element's next-descriptor pointer.
>
> A list_for_each_entry macro is used in the comparison phase, which
> internally expands to the container_of macro to find the current
> ls1x_dma_lli's next-descriptor pointer to compare against. However a
> problem occurs when the loop reaches the final lli list element and wraps
> around to the head. The head is a different struct ls1x_dma_desc. It goes
> down to the offset the node member would be at in ls1x_dma_lli inside of
> ls1x_dma_desc.
>
> This leaves the lli pointer somewhere inside of ls1x_dma_desc at the end
> of the loop. The subsequent phys debug value read therefore would print
> garbage as a valid phys address.
>
> The primary bug occurs in the residue calculation list_for_each_entry_fro=
m
> macro. The lli pointer still points to somewhere inside of ls1x_dma_desc,
> when the list_for_each_entry_from performs the same wrong offset
> calculation on ls1x_dma_desc to determine the stop condition of the loop,
> it lands at the same offset that lli pointer is on, and the loop
> immediately stops.
>
> This produces a 0 residue value, while it should be the entire length of
> the lli list chain. The driver advertises DMA_RESIDUE_GRANULARITY_SEGMENT=
,
> so a 0 residue would mean the transfer has completed.
>
> Found by the following Coccinelle check:
>
>   scripts/coccinelle/iterators/use_after_iter.cocci
>
>   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
>   reference to the index variable of the iterator on line 450
>
> Note the check still reports this line after the fix; the remaining use
> is safe (the cursor is only dereferenced on the match path, or reset to
> the first entry otherwise).
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
>  drivers/dma/loongson/loongson1-apb-dma.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd20ab..8bb6e6e5719d 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -439,6 +439,7 @@ static enum dma_status ls1x_dma_tx_status(struct dma_=
chan *dchan,
>                         struct ls1x_dma_desc *desc =3D to_ls1x_dma_desc(v=
d);
>                         struct ls1x_dma_lli *lli;
>                         dma_addr_t next_phys;
> +                       bool found =3D false;
>
>                         /* get the current lli */
>                         if (ls1x_dma_query(chan, &chan->curr_lli->phys))
> @@ -447,11 +448,17 @@ static enum dma_status ls1x_dma_tx_status(struct dm=
a_chan *dchan,
>                         /* locate the current lli */
>                         next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEX=
T];
>                         list_for_each_entry(lli, &desc->lli_list, node)
> -                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D nex=
t_phys)
> +                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D nex=
t_phys) {
> +                                       found =3D true;
>                                         break;
> -
> -                       dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad=
",
> -                               &lli->phys);
> +                               }
> +
> +                       if (!found)
> +                               lli =3D list_first_entry(&desc->lli_list,
> +                                                      struct ls1x_dma_ll=
i, node);

However, I don't think falling back to list_first_entry() when no
match is found is appropriate. Since next_phys should always match one
of the LLIs in the descriptor chain, failing to find a match should be
treated as an unexpected condition rather than silently falling back
to the first LLI.
I would suggest something like:

       scoped_guard(spinlock_irqsave, &chan->vc.lock) {
               vd =3D vchan_find_desc(&chan->vc, cookie);
               if (vd) {
                       struct ls1x_dma_desc *desc =3D to_ls1x_dma_desc(vd);
                       struct ls1x_dma_lli *lli;
                       dma_addr_t next_phys;

                       /* get the current lli */
                       if (ls1x_dma_query(chan, &chan->curr_lli->phys))
                               return status;

                       /* locate the current lli */
                       next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT];
                       list_for_each_entry(lli, &desc->lli_list, node) {
                               if (lli->hw[LS1X_DMADESC_NEXT] !=3D next_phy=
s)
                                       continue;

                               dev_dbg(chan2dev(dchan), "current
lli_phys=3D%pad\n", &lli->phys);

                               /* count the residues */
                               list_for_each_entry_from(lli,
&desc->lli_list, node)
                                       bytes +=3D
lli->hw[LS1X_DMADESC_LENGTH] * chan->bus_width;

                               dma_set_residue(state, bytes);
                               return status;
                       }

                       dev_warn(chan2dev(dchan), "unable to locate
current LLI\n");
               }
       }

       return status;

> +                       else
> +                               dev_dbg(chan2dev(dchan), "current lli_phy=
s=3D%pad",
> +                                       &lli->phys);
>
>                         /* count the residues */
>                         list_for_each_entry_from(lli, &desc->lli_list, no=
de)
> --
> 2.54.0
>


--=20
Best regards,

Keguang Zhang
