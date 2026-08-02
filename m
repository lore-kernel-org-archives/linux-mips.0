Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC43C063A
	for <linux-mips@vger.kernel.org>; Sun,  2 Aug 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785683851; cv=none; b=LJHyWtBC1tCUbVr0iAoyToT01yz7uZsp9+noqm1G7pML2SuwHoIvinXxagtb3KoS/vkVeXL/HZGlFnZxa3ceiobSo6CSeDJGqfb5mI3fsQUzpzOJ8kFFufqErTu3CoN+jnQ9BbllE6/8/7pH1nAo1Aa8RVhlO9iiyZ8K0yXBr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785683851; c=relaxed/simple;
	bh=kwKtCzHqVNLmvmbRWDtZ4qdaXhq1tzQF5H9RXZO09l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZPiVywmWi1y7VScqJPiQoj9FxcMPZgsL9gcsyS6yavC4UxWFor2aVGUEdc4hh0EhPKyyUVe1deoGxP/Ho/H/9oXsQW36w4NY3ZXJ8Z1becSZNMgSa+g7o0Y0BWXGGNHwPvgxx5ooYdAy/S6fUrpa/oDl/gv/IIL+WBRyTU6hks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD/ZIuNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xkvq583R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mD/ZIuNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xkvq583R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672Eawqn1364565
	for <linux-mips@vger.kernel.org>; Sun, 2 Aug 2026 15:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fKT3525c6PBfh1O3lI3Q8DpJjSKVVm/d7bmUxqPxLQ=; b=mD/ZIuNUTxXPOT20
	THiAYaenjRmX+viLFqYfjkQPJ1BwJb85Ale1ksqnpFcHjLTht4W0XcLWidSuSTQ1
	v/kwOxG/i2CyLge/P6Bevil6EWEFKRdKLEys65XnTjhNsxvSYd/gNnP0R/XP1q5G
	i7UpTeW+G1edK4Pc211M8g4RMYhh9Zr/7/NCmJED1FhiRohGjxudfdtAfWq3hc3H
	QgjbyIMH9K0R4Vr97nTPNeIATnAlvOb/S5iVUlJ38CNZ5hoNmaQiL7wTS2E+j5nK
	c8inK69HPDGXm+H0hEqNAfuUl4pWws5ylFo/J24QWUQWj79bB/2E3aRiKcC5br2p
	0as3sQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygjv6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Sun, 02 Aug 2026 15:17:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so243382885a.3
        for <linux-mips@vger.kernel.org>; Sun, 02 Aug 2026 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785683841; x=1786288641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fKT3525c6PBfh1O3lI3Q8DpJjSKVVm/d7bmUxqPxLQ=;
        b=Xkvq583RGkkN+g16Vv9YA8ekSPL3Gon1sIrd3V8ncQ1eFEqTGq2hjRLFmPBDQ3Wz8/
         ZUiMCQZgyjTziLEdPZnCAdhuBs9zV/85PUgOKVLBDP62worjFoadFnbR2NOiFsv6YE0c
         A96euPghZenXbkxJTaDeFj/G4jcGmtSYQApYMpUKbwEVLIyhcA6a9By5qaIOyr1uAPpi
         paDOEhrpZL+V8+O2W3eC2YHaDDxIa0jssjHWbI5hgemrrszetG/F2ehT45eK9mUuRFiW
         PbjjggDjP7cDHV+ic41frJJDUilDm9P0HlMaeRY+iUMApy/S1Si9e8zJShmeO56pNB3H
         cMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785683841; x=1786288641;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fKT3525c6PBfh1O3lI3Q8DpJjSKVVm/d7bmUxqPxLQ=;
        b=kzE7FUUykB/vXoG4KN4G7d13D6Vp1dD0C0KJiuVn5fGZMt/IR/GGf5ewL+D7Ia0KUD
         fSNtI/4hJSJyovNr9uYyZG1qOEB5xyOgWozKAGFnxM58kQOSgvqQdOOxiuWmzys11HdH
         n4xbgaPAhTVBQ/hrOBKYMXUQxLIe8PjtXssPZN1t+jTKPAK3ZLtCv0XOvxb6YwpAIcGq
         nVZCTrNe4vZ1F5qWkPqrhyZgZRnUB1MxZCxmm2S31VXmYVZ/I2BJkBhYc10rtZu3lipT
         OaG5CTXEGpOKM1hnRxXM2cQDV17H3RXGRyClWAttsnpGjjqEyIN4ddtp6rFR7p8Qif4i
         Ypnw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7qojWuh5/ehToNEP9kMaSJ8aB0A+dYnSYjzeFykbWS0cLUZ4B2xTT8cRZXmvic7F1cMUIxUwwxFFY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2+hpjhuBH8/jtcX+ir752Hjbs+UK0f5gT93NPoswHgFIh2HRM
	hH+itR7RvDLOd2hrygpsUqC5PQENfD9bAEL3VnmkB6TI9fDy5CwJV0qubUaTNxyTC3/s+RhADaM
	Xlf0J7gTPkTIYD4E+QF6cnT/xOkVz6kbSzr8Hri3uDnv6SggH+gB+WRHwCpLz2k3x
X-Gm-Gg: AR+sD11m009LasKUWIxPB2VrR55pkjsmWzkvyDhrcc4PQOAoZwdl+gp8IUj1la9mKQ7
	HFVwl6SA/jWxzXzwNQNkQhBZWPfuCJHhLGDXO+ejTTT+/lOSgt8pK5TS1hxsZHqMctdXqIx/gKz
	fqUDNKu6+SHAjqeQLI4QQH4t0E1kTYomGd4IsC2btsm/tWl93P6MKUFdiwOHYRKDSRdyVl64Qb9
	Tw5n0rt85InFMr8vZFa4TJP0dFL0ZX43C4za0/uvQ09gawrQ1ZUYcek9sbUukYt5Hzl+JmnivmA
	Y2s2ysE131EqYF7/yYgO5XA4aU6lgcr3Zc2jq/5oeJYt+WQZUxzNg9iXcCgndzevDXs86fUqpix
	PVzyc4RrYnDwIEFvICGK9Uq5E/2pgIb1xQkRh5wupoM9JAW947Vk=
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr155597391cf.12.1785683841329;
        Sun, 02 Aug 2026 08:17:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr155596841cf.12.1785683840851;
        Sun, 02 Aug 2026 08:17:20 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b4bdc7sm88966865e9.0.2026.08.02.08.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 08:17:20 -0700 (PDT)
Message-ID: <7f0c699e-a530-490e-bfed-21840ec07861@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 17:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: BCM47XX: drop unneeded semicolon
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: kernel-janitors@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801191002.1383835-16-Julia.Lawall@inria.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260801191002.1383835-16-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEzNyBTYWx0ZWRfX0f6BUQEFxHWL
 MrbUQTTO424qPmFjXMwLKKxI5gRyFsddBIspYXni4FFdx1OnTCHllqz21CGZK6MsJ4MtrzoGlHl
 xsnoa305EWMBO1EKxErMKK4ravf9yDU=
X-Proofpoint-GUID: 9nYQcfCJt73mmb-ALhe9OaAYCYlz2N3s
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6f5f87 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9nYQcfCJt73mmb-ALhe9OaAYCYlz2N3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEzNyBTYWx0ZWRfX78J1hGFo6l8x
 8PIclIM3E2U0E3+hKRShTpfR+k59H6COK3gFx47UlnGhhU7dSvcTjQ2/bmqULG1ZWaeHD17D/Nk
 hcCz45tjdmOc4+JObIKyS3s9gS23rBF5BbyVWVHxU1A2XYbBaFMtnjfwmrZT40lTmUM3oATCeaH
 +9LAZBN0cA/iIABvw5iYw9w5OBR/X3xiFZkYg0y8j4oPQgzHzKsYMthMMAkyVeEZ6hWr36eW3z9
 dJyah9G+w6BEBwUGzp+l8vd2tRXqO+nBAakc8GgBSNlOnOWY9XTZuCGALOkcwivSVI3UsIliVwF
 qF3eCVpjNp42EvFaL2ORy38MPWSMyC0W6QdKR0yj2rEDvMyAR56lzb+D8aTDQrQO9KORgmMYexJ
 6Xz2X1JLhWma0cpPpQpfgfGM14KlaPVL25AdeyTgxR7LlHDDK+YtfXSTL/tcOFFIzqE8sUf4/fO
 MaT5XBtIL7VFHDx9uvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020137

On 1/8/26 21:10, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   arch/mips/bcm47xx/buttons.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
