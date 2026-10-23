Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750724;
	b=WRJE16/n/VAv5r2I5GfiT4E2yiiQinDekF02g7FZ6Xz1cq4NvaQYEaY6J8og2afzsZbu
	 JqpT9lG5tUVCl7/wg5hyYRKxRQIKikuYl0065hdp82yoLrLe+8E0IKGgn2iQbyvZ8ryMj
	 SkVxVAE7keNoC68fSnzQLNobSwLAq2uXINUXNqoU6ktYa97vorwx9Buoq/Oy/r2HLF/fp
	 QYd9Zwyrq2+RH7xsJV4rJMe5eeHtmk0Y4hCpohTnBMkd4JENug6JcLp43wh8kAohikgb8
	 DLTvrKBImfm1PAnddL13zORErMg1OOWBiemj8SK+okdrx28aeyoaUR+e90oTbB4QlsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
	b=qim48aHO7W7Q8RYLJJU30+tJCCZeSZBW8LmWWvvUiEomChgsneUkSLlGzNrkGSWD0oxo
	 A6v4SLyTN9SG3zKJBTwQETCGvXeyZxTZpSGIYxMKjdEaFQR7uL26c7GMd6+KSqyFXEmtv
	 lQL2NqySw+cat9bZi9IYlXTpypOVxl0KnqmpiiDlZ0PS720Ev4ZHsRZZYbL6k0O6lwdnZ
	 z2uNHQxcx6l3S3jMNoKFNiJ6v2yx5omlG0rcIg+F41hveXrggyZObvyvoscdxyWwTNfX4
	 O3/0LVhkl/LensugyGnK+5Y/9PTJCetDSl7QOYHUdRUEP3l+FPmiACbE3YmLT1qkl+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D238606A326
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D238606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAR7N3550434
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=; b=BcgynjsHOsEyW0p7
	JmBaDsQ6nFQLkANcOVu+eCxU9MThVEiziIsFIThVRj72ESReWsq/2Fjlue6EMw7f
	QG7t3qTn0WrzVdngMbQxjibzLT4HeKhh3qX6VnfwOLHzcXvE5ilS23eCh0gfEZ3V
	gJdN1CF7iZTXsVzV/Da4x6OyFDP+nAvYJbtvKk8g4DpMYruI3A4MmZNNGmIgHFuh
	HQLr5vagq7d9LX6Hl5Z7FUUkE8k6BcGB7QJFrW6hfi9MgYUijr0hAVom3M6rkMS2
	cyyjxy/uNB3eb+d6uEcH7zV8JdmH2kJx/yvZVhQwRVX0UqIOddcFZnJf/IIQ9HG7
	+vI2uA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrb67h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so153470485a.1
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750722; x=1793355522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=YE8GQJzlyuIDwIzkXS6EO/0vsC7REihvins5pqREw2lJ5PJjl1pPc8vGO91lstg23V
         PYFf3ZDLCAVT11iD1QaK3DfSR4+OWhlhT0cIcoIOFLJukihXDfo0fILomrH6bUoMS8RE
         E1Ddl3AXgAy8Vzy2uop749Lg6Ute4hBPt+Bokfg8TsE8m28iuuKSPWfavtZLlvSgAzup
         Ieau/oLgkKsQ6ZI4QRyQo4tvjQnnw8751/HAgYhq8TCWA9UWiYLa+Bfs+8uOthHI52EY
         6YM/LEVxpgDZ+lPAIPJjg1gfdHmMnka2eeKNXISkFWrr7ydGRE+jjBNYWyxlHx6jZgj/
         sZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750722; x=1793355522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=MEWB5UG6+D3WfaG9tBwQmtpQ87SZvRx85C+04qcWUNsY/aJqHBGGBpG+ONujhnt3OK
         vldH2pUrvTwD3JoNts3Q/LYUNdVGPLFZKC0E8upKBxcpDZ0pnvzZ964jdamK62932Nac
         2w/CrbGU3WpV04KiXda09X083nZ3BxTpRfSjhg4u37NI1ntxtC8i3T1vOAhv2/K0MaJ+
         BVFZ06RuNMRmyobu9oowXOJZT0aPwFAAHQvEL4J6i6pimb0Skm6WKJev7Xxbg8GI6A5a
         iUaWnDWOMCoDuJ3Msx3bXmmRTYGf+bgRQpr6L08ExAl0pwhexVXha4hRXo3ODJdcj4d7
         u4BA==
X-Forwarded-Encrypted: i=1; AKwUvBxJOlps6+Z0i2nI76UQMjd4gLF2KFutwcFW79ZFW9AF5FtmmmqKALqW39vQUdxUP6SKG4VA7uZr8wOk@vger.kernel.org
X-Gm-Message-State: AFq9FYI200OKfYAxHtrOolwLT1efbzsNHz4G5NFcTMpvBNQXZkBDVTTx
	1S+dgfWPFnPeuERDXu+7e9iQ6bQirVqjY6hYSlPwTfhLT+tRkytsQu25k1MvUeBBz/FfwhOVTTx
	Tf5NAWojXxMC2re4/UuQ5ZiFTlpptSrpjBb1Srdw4lCseVvhxnH7xAxLNRMze0iYY
X-Gm-Gg: AYBFou0LOS6vNsp3bnjsDsws48mxZMDhW7aEvsVxe0NYntOI5bTiR3yQ1XqU6PLWtR6
	5Wdvfw48n7sRPd0KFPDhUgDstqY/49t20hIS9NIlUM+mIdfqlOzk4IOrZqweeTfatHVpbuxZcU2
	SgnQnyMfNur7BKaR1luoZin7fKAhxmAWF330Wm3ujkp2CiF3zIX+Kvx/nXfkTYi2N/irSdytcL5
	AwhfW3uSHdXeQa3vN2twB/ipL52cI2EwC8omPCl569NwAMSBKE3HPy9JEDRF/amfzyKW5A7YaL4
	1jsU7fRlHqKlZCrrTs5ifbsqrXLXcZSPChwctFd1zJXwOjW1rSQ+opPWlzIToqK2rktq7GcLsK/
	XqmNINkLzrNP1/LMIvxtXMDSOStQ=
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362486885a.21.1792750721647;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362484485a.21.1792750721242;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38053b8asm3894504f8f.42.2026.10.23.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Fri, 23 Oct 2026 12:18:38 +0200
Message-ID: <179275071555.146035.13882849400290683549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 24gEJbC6zAbOElcJl-frmXxsiDV7Hf9S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXxpedqY+ZitU3
 CflmQcfddps3sb5A8aoENEd3HjRzUxoM40bWyifa0aloqIzwVBN/soYwW6s0u1uQ2BWuLdqr+40
 fl6rHrTabcsjPyBG1F1GcMjQZ0sbnmQ=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb3482 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xyndvWGceNBv60aQF6QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX2otwWBtnlThH
 7Wqs0WI5BGtF5t5WHTN3KXkY0tgfNVBx8P5rfA5DXOPffsOz8/IMn55+xkP4/tpbMPpaS0hKVpy
 eqG6MNR2zNdh44KEX1XQEhyCMwyg79k/mVURbomz6rCXZtkD5m+dqo3mxyVT21lCN1oCoqKYhHu
 EpcUliBEe4xJ0TzOViWWTmlBA3Wu2gl0cUPGE4iRPvk+yVqKFvtH43/6+A8jTm6dwZrzyaWeYK4
 jF7MYg+tGU779uN3BNpJ6AHDT2e/5ZMwR1EIZ8GCf1YsJZxVKL1qf5FZ3rLF7wN4m9d4W4RB1CL
 qL25kSZY+10Cn7rpcHpjQ0Xqqu6YlY7I8UE3RFW/Xg+acGBASu7PCLnImhQVz+IyMMXGxDkmM5w
 88ry81kLUBGT99y1uwYHxKXrdEeox/2CFQxBv+yGPArxk4CGUXjR+PUTib1v6sZM3o3228rxU2Q
 xjLmP1JaUY6j73QyPTg==
X-Proofpoint-ORIG-GUID: 24gEJbC6zAbOElcJl-frmXxsiDV7Hf9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039


On Wed, 15 Jul 2026 20:46:40 +0200, Andy Shevchenko wrote:
> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has only
> a few users and high chances to be killed soon as well.
> 
> The series is supposed to go via GPIO tree (due to nature of the last patch)
> with possible immutable branch for others. Please, ack.
> 
> [...]

Applied, thanks!

[1/7] ARM: pxa: spitz: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/e4c5145a8c42b1ff8c36d209b265d65005fb2a8e
[2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
      https://git.kernel.org/brgl/c/aa6a84558231f61264bd09c8ef013c7bca63db1e
[3/7] media: em28xx: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/492c8f997533acc550bc23be73b847f5e7bf3e75
[4/7] MIPS: BCM47XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/878804621d798dc9eff6148732f74adbc45e99de
[5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
      https://git.kernel.org/brgl/c/6eeba9dc60aa6a5e2a617c7e08a6ad4da325c1f9
[6/7] MIPS: BCM63XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/1805476b1a49aea62787072b28d7a2d5880c53da
[7/7] gpiolib: Get rid of not used anymore gpio_request_one()
      https://git.kernel.org/brgl/c/dbc9f76c3ce301c76991574e1944a0d2a8717062

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
