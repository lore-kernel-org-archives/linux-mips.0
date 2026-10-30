Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358059;
	b=KoE/bFeonq0CeXkJ1bh8SeYa4/0DolTI1YszL6ZqqCkDhbHcPPW8B7gToIpoyfShNFeB
	 iOftgX29beD78k9zCr/xDqMAsrD7ZR8okRQayvnFB7UfyIZy6mFFxFNVJGJhbr3hXZpLW
	 pb98YuSrMLFRnJH7uzeLC//8Ehl5AClB8uxacFRLW2nzxsDCute5tgcZ1bcuSWjy27y9E
	 XqRSIKA691nGU3kToy5bsg7TWJS4T9Q2UpyEZu1a1OERp8GrjQ1ah9HaSBP5y6KXG5yFR
	 +3qo8ffytAN9epBNuhVb4l+LUy8BnuSeiteRidGVJV5IZck4TmpLB+pqVVlnLwz3B0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
	b=vNFurUmmhOR7M+qP+fusCtqVohYo11dssEHzzuTaqVE96GC6cXYfmTzW1/Wv6jUEKgJU
	 LcZY6Vsz+2eXxoIZSTe8GhBtmB4gCSXPz1TF+sr7+0kD/wuhbZ8q19Hgpd5hdU4Wo5FqP
	 0WhHc/l3uTADeA/4z+KiubqQ0raaXBsv/YpL4ZnewlSC9cnVYrz2H09P+B2vtkJwLxOE1
	 L1R8XztfbtB4Vtg4HAQSo9Gbs2QcVHnDZNolwlOVkV4GaPhtVsiWWUyQizcS5Vz/jk4xt
	 r+GliddiWFizmZ/Zx+pKFT0UzC69/EuyYAI6X/GdyCgCFrcZnQ4MeShf3/HG9FajjfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRSz+U2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FI7QLv6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518CD606AC01
	for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2026 11:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518CD606AC01
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRSz+U2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FI7QLv6B
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8ExP32682223
	for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2026 11:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=; b=SRSz+U2nRlJjrKpd
	Q6yg7Bis+ATQdENbDuC3boFhFxQXruNNjF5GKAiOHMK1ZUkeGa4oqcl2AyzInRiF
	VNCXoz5L6+6oBpNwKard8J79jfQNHTRU0sI01CQtej2l9OgXwHgJxOvUTU1BXQ8Z
	SG8jfDxeMq76H/ituJS90fLE0lzYD6AxWMxJFOjUAJyQ/H+TmlVEn+vZoJM2WAXa
	dPtZQK2eftP1JhV9QYnMD19qhDhvEUj+vV1N8WchYs8SwxmO3qW5ea3Hh5CVY+Cz
	p9hfWCQGVPPtA+HY5cEqo1yoQlSZ3fHYxWA87/oUD521A8wMEs5tiBK0HVTsG6Ym
	hN9rTg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjkeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2026 11:00:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso110846241.2
        for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2026 04:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358058; cv=none;
        d=google.com; s=arc-20260327;
        b=ODVN0gxk85JBFAwhRs51Vw1vA75lIjVro1BzoqUOy0yPrLPswHeJq74Bb+eCw7z066
         3QGhJ+Xdc4XgHMZ0RUrOJWIVGcho7SsNJ9BEg6i0hX2qXzFEemPaOOolJzl5RHH5sY6d
         tr2ILRMS5fxnvPAyIeaD/zfkby5rVtBm6wrCW3rv10bGmSRduQj1dooQREEQVR5IwEua
         f9QdzSJBoRtgUXF88WE4Q6VBQE9AsVD8gNPKRyxcNgM2t51WSwXRL3RkRcmC1dnqN4cU
         Q/aaxl1fAKe4NPQ//60GaTFKWc7U5ygvIlLWUVzFU9AnEb/RcZ3syfWY5/20UF/+7uoq
         1fKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
        fh=o1DW/YxKZc18FGOMnzjk1zvHlGB6BRIKM42PDWc9LB0=;
        b=IaTbl15wS+YLf7i7AAtKZR9ILp1po96OXMl8XFdCsS540pg0kF29rIzXGuMDWeEXQh
         4inrJCcG4sNXAyp6u2rfExVi9XPoWHS/lZMKVE+L8jOA5JOKuh56lzEjAaXDx/ZBiNTT
         uYGkydY+L4EU8lebM7jaPXfEnNYGfS9d+ObHdshcCu5yZAyISebqbSct4mQkhw22byCm
         UiIeqaGuCe4Oq8as3kRaQ+V/tW76inMOThoWI21KY4dYbiugsrxuy+Jkdh25UQx4R6Y0
         sxqL1XIQJQaqkem4cFga7TSWaLxTGjpz57jMAAC5rSj8LrICEZXOq0V+hZlCtdtwR/V1
         dMTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358058; x=1793962858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
        b=FI7QLv6BE1G2fQvhlC+AOZ/OSC7c63qEEjRaA2KtyShM0uhc38YdUeDxEUky99oGXa
         V2dIMQ5caqR+YYt8jxtsnCdp7X9F3lVPcOX2B3cymNdfiXhIkQhpmzMpvHnydZhwiqUG
         jsHYpVvlord+lrqLX/Vw3ZVTFGbl3MKNAQx9kYJHzq6BA82ucmHYjbjf5YBSjva0vPi0
         4gcZmzrgpZqEHKOHmX9Nb0kqcr46dzDivh1NRHh2sYOHKjydS6ep7lRGY5Yj/qKPpzF+
         TnVYDZb7ohuQQQwtU8xAw9H2ODkpSdFSWKinTLwnNGiNe4u+lfS+GSQIocWQYSuH7p+/
         0xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358058; x=1793962858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAJ/hdUbWhcFTxamLR0wIqhORt4vEbGpFTQmQv3h7+g=;
        b=EP+fnWPlRqEJVNdjeA77U4ZH87eHp5wtg89g9AwH25ANRahDZRcEZYJFYY24M/MPzA
         KFAQIcQa8POBjIya62y27Zc/xFbq2XsITU/SwwBMaCmpmigtTj9ZRTB5l0Kg4zrpBgxY
         YW3suqVO6bmweY8IfcqfK8OmcDkjFi3FvwmQPg4B/W0RTgup6JUXUH/lOAFU5G6HHael
         XEp7wGdJ+7CTiJR3ieW/22ul2rc5MKHPjFQkg+IRIMJ8FABbo6eN8bdcHPS2oIGhBiLR
         s0YnlgP2A571FxpmysBuk9Pj37vdAxbd/z8uL1KaQKvFn6qDw1iJ4a7uJzrFn2nPaMv0
         UCKg==
X-Forwarded-Encrypted: i=1; AKwUvByCQhg2aWaIAdU3Ad7/o2McVAdqc35XPR8j2ySErQUDK+ILRkJ7HJdLlUXLTsAj4PdvVYmOt8VVUGa7@vger.kernel.org
X-Gm-Message-State: AFq9FYLhZpx2GP3ZLWigv6eJli0ckMCj89fiRFH/EdH+iAhB2s7qXOje
	K4LiSXV2ZcLR4yEdyT8oXZULkac9uBoIRJKS9Ul0LOnU/4qfaMx0yqVb6yiPLiw1R9YPdQASB/u
	Am6/mjOwvQX8six3lKvgLd+Y+RgKnIeJUhman7sTVvxiLojnOFrctC7u+giXah9rpsKAmXHLzVB
	NbqXucSndUWb6RjfWWP7ftRlGQF5iWEnqbPydgTuc=
X-Gm-Gg: AYBFou1SFpEl5bvRkEWdZunDWeP+y8Cm1Eto3sIZb30An9DZwCQOCAKXjyg8Iq2V7OP
	4ktYAxSBDV2yYThwMj+AGWBSxJ1kD6r2ip0GUAqaDe6Y8A2T7Z9u6GIshXchxw2qQW7MVEUmFZk
	3VXyOUeRrJkdDP63zhpm5Satlg9MOVGCe/WSP/1IEtCCfkcn7Asacelt3KHA==
X-Received: by 2002:a05:6102:f86:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d072baa420mr807236137.11.1793358057277;
        Fri, 30 Oct 2026 04:00:57 -0700 (PDT)
X-Received: by 2002:a05:6102:f86:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7d072baa420mr807207137.11.1793358056590; Fri, 30 Oct 2026
 04:00:56 -0700 (PDT)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026083323.12301-1-olivier@mgcrea.io>
In-Reply-To: <20261026083323.12301-1-olivier@mgcrea.io>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:43 +0100
X-Gm-Features: AclHuK-AAb62Ju0lDchg6Zmy0m7PPdxFmDlZjEld1Ivf9CvuOqz-27SR1i_D8JE
Message-ID: <CAPx+jO_ZxVn3kRiWpQEZ+RcbMG-wKznXo+F-2v2Yc4WpHQzqFw@mail.gmail.com>
Subject: Re: [PATCH] mmc: jz4740: Remove the host before resetting the controller
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matt Fleming <matt@console-pimps.org>, linux-mmc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -cP60eW_DohYqNU2fbofROmhneNniUd8
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae478ea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=2DRyhdssraMOevLgf_oA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX1v8ANJFIy68k
 7XP2ND9ksPP7I912dayqMxlg47J4BRRRrLOZmOW8ilHskM4TUSuK4PvBxX+xwoCUvUXE6QRaGtZ
 YoixLsetIAexwfTL0bgNkDz4LqmXwhDirqc1l/bE8JNMNo0I6ANXWm+PFgCOUCIPYQ3jXD9MPiI
 8DAY7t27CZQoL49b8Gg2+DnO6h0S5hDtbc/QuxgXj+ZdLUVUXoHHYuRspBkhXZBVYacSLuDSw3/
 FxzGwyyQj2y4K/EvCIqnQDCAxpvD9rkWnUy0VktMEUJuUaM2AIT4E3F0OW1kcgUD3xUXUT7n9Wm
 w1/K76XKpEqbipNv6Pe1nS1Ov3TluJ1ECBDe876yGYIqjGnN9JIqgHhc/LGGJjrhdbDt/0jgjAQ
 CxY3uMM1zjpC1rScYU9FHZR6uYCgHAFtyK7NWbTq2D9PJLJtJ3kN/GMb/8SPoaqgXXoreP+aVZ8
 2GTj1fgQk40CIpofIOg==
X-Proofpoint-ORIG-GUID: -cP60eW_DohYqNU2fbofROmhneNniUd8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX6KAIK7aUocQw
 BYfOJYdWb2I8mvamuUW+1sQchq/wk7+CSDEcCOsGip+bkLSo1qcnK5WEeXlrzerSP9r/AHjB3Ou
 nsVdZD+M8JW57Io2Gl1ta/j0CJ6qACM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Mon, Oct 26, 2026 at 9:34=E2=80=AFAM Olivier Louvignes <olivier@mgcrea.i=
o> wrote:
>
> jz4740_mmc_remove() masks every interrupt and resets the controller
> before mmc_remove_host(), which removes the card and lets the card's
> driver send its last commands. Those commands then run on a controller
> that was just reset, and can wait out the driver's 5 s request timeout.
>
> With an SDIO card that cost 5 s on every unbind: on a HiBy R1 (Ingenic
> X1600, a BCM43430A1 driven by brcmfmac), the CMD52 that
> sdio_release_irq() sends from brcmfmac's remove waited 5.1 s. The
> command had finished (END_CMD_RES set in MSC_STAT), but MSC_IMASK read
> 0xffffffff although the request had unmasked END_CMD_RES. MSC_STAT can
> still show IS_RESETTING after jz4740_mmc_reset() returns, so the reset
> most likely completed after that write and undid it.
>
> Remove the host first, then quiesce the controller, as other host
> drivers do. On the R1, unbinding the Wi-Fi's MSC now takes 0.65 s.
>
> Fixes: 61bfbdb85687 ("MMC: Add support for the controller on JZ4740 SoCs.=
")
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/jz4740_mmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.=
c
> index 6a3c26b7c82d..923cf1450de5 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1151,12 +1151,13 @@ static void jz4740_mmc_remove(struct platform_dev=
ice *pdev)
>  {
>         struct jz4740_mmc_host *host =3D platform_get_drvdata(pdev);
>
> +       /* The card's driver may still send commands as it goes */
> +       mmc_remove_host(host->mmc);
> +
>         timer_delete_sync(&host->timeout_timer);
>         jz4740_mmc_set_irq_enabled(host, 0xff, false);
>         jz4740_mmc_reset(host);
>
> -       mmc_remove_host(host->mmc);
> -
>         free_irq(host->irq, host);
>
>         if (host->use_dma)
>
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> --
> 2.39.5
>
