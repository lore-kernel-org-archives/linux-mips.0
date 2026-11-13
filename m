Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596895;
	b=EkKX1dULVoBBwEJTZQ0ctOtRgubFSGYjga0SZ5KOPIesgRodq368eW5f89zD5DwKDCRA
	 daBcOsxhpjVURhZ2YXH+uGcVai+xCCQi0ImkKAULc11GwB1E6DuK8OKWnwhyCyu+6/JEs
	 HP5vgCZ/5y18kPfsTRfe70aFLENmx6UBCon6mKsZxIxodsID2Sbt2gWQp75IUDubFjdL3
	 OAoIfkLGu18fHeXvTR1/nEPSkhpWktWiinVe+3LWJr9uod7b3WQyQvUVgUW0heQXHeV9E
	 ZjSITnEbgLH+gpyakNPEcl68sqZYk7tdB15/kLbIyQS6kvYOveH4rYJeGm8Mo4jJgGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+ZYV7qXENnQKI2uj139nCEoDqjGbKVU2N1/Wx8WKrNc=;
	b=Qom0EsBxLoiDLqMtLfI+4XAau5MZzqxifaOdvfEVkKdkVL9fOJCIweb5vqCum/zuyo/r
	 RAI+eg4sGwWKExnILrOP0CjJbVQdkXL6kujLbufT68+Ta83qWtfoGElzorbav3bo3BWDO
	 eB3Ox0JWifLz+F0Z7T8C9I0wTKmMsUSbIiRIQSPMSt3Xv7QtHZHJBXssaS0dq5ISCJI5q
	 Vidn79xGxSJMypCUGt6UJ1Gel0Nyz2AaEZCTbiSRhStygWQbpdAdypRvkyK3DOZhiltCa
	 UqWeORaoolB0uKWTwoZcXrnxQt859f9rtfi25RAFihm8Bc1LPXs0Bh5QxwF4NwCgoLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=k5zOlm2R;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=n1Kq45z6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9868606A893;
	Fri, 13 Nov 2026 19:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9868606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=k5zOlm2R;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=n1Kq45z6
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADIwSjD2034475;
	Fri, 13 Nov 2026 13:07:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+ZYV7qXENnQKI2uj139nCEoDqjGbKVU2N1/Wx8WKr
	Nc=; b=k5zOlm2RWxWntzSRWzTYnT/xX1FRU6w3iyMNfIqDyHYvKtiKiAukYKsa6
	RpjEsEnpEXV5YAGlUkDlRt2EXaD6abHe+SS34kO75A6tL6HZPBZwpBVMX60sMbut
	AHYOksKEzo1RH0q+5+1kY1PngP93mwGzM1dAZauPeygDc3VJbfRRWE+wmzlc2vDc
	Ohz7h3OnfSC+usH8ByT3nUTax3EmUVplodTeryY88uI2D1ZLHiavNcPBUIKczFea
	ZhQhbTwMwguJt6t4Tct40Se85hjtv8Hqw9YMOjzjl7i3h+hVQ7hcFhov0U7MOn++
	vCg1O7HbX7KzHMQsGUNmTu5sucigw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwym3bdjn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 13:07:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGV4nl3+DkB/BGzPKefDOgx8h4oUVsAjAfAZTNR1J5nTeT8ts4uYaox2PAz3Cgw7p9XtfcaMdAE206Z2rMCRG2YZUy3HNaF1Ctq0suUtZZEB6TSyZjeK3reLfVtyoc4lQmvqO0IYJ03L2vMOTonBWoHyl3QQ+8pSDSZoQU0/aU6f4NaPBEmP32p3nGD8jijtjoJBnG9tqJflDzHI6xQTkCYSIR3tkDdnZOGaYjBML1ehZpnqyH5KKp95cIVQu5hLxVlTEF9oOXh5iKgIVqWqw6x8VNOGozROe2mtYJn07yomsnrGNNK6ukRhXaM7u/smMjDqOrwI24mWagHZiPVtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZYV7qXENnQKI2uj139nCEoDqjGbKVU2N1/Wx8WKrNc=;
 b=Oa92j2WrBVoGoFBBCttukxMr1zaL8kJGgpqK89o3hg+K9Tu8gFE+h+z16zNWVavgpZRMrk8keYgE13G89CgxZoBSNjLHfuGQKWn44E8dATdghqneql0aUAoU5aCj6mnxi6xwR9es2ZAGegFOh1GcMj95NR/1TABIbbrOUcM1xvkCwG0YAuXabCcGWqoh2gSSyZsjHjMeTsYs9c/iPQvHVLdnBewJa9SYNvte2T0e5GZ6ZaCBiZhg89cVvWr6A4Vxkr045TvDwkdTic60aGU5391pO8a2ZmZfRGbUsOOstcX9n6axUoTfT5bb4VYxmBDtQ9nP6wLt97oH/tqkSJDNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZYV7qXENnQKI2uj139nCEoDqjGbKVU2N1/Wx8WKrNc=;
 b=n1Kq45z6DRwQYaasftPBnxrpvEoC0aZh48yphrNhZ6aBMmEJ/S3ztByrxJOcODYC/Ap0868YbsOY1UiGhnoiK/AKE7ECPhpbYT8NM6AmGfvMyzxba4dseTTZh/1fvM1LPOcBjRxiAHYUNTGVj2rrblcWyVN2wtNm3RaGBhZhKMc=
Received: from MW4PR04CA0198.namprd04.prod.outlook.com (2603:10b6:303:86::23)
 by DS0PR10MB7127.namprd10.prod.outlook.com (2603:10b6:8:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 19:04:52 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::34) by MW4PR04CA0198.outlook.office365.com
 (2603:10b6:303:86::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 19:04:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 13 Nov 2026 19:04:52 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 13:04:30 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 13:04:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 13:04:09 -0600
Received: from [10.249.34.41] ([10.249.34.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADJ49uA552279;
	Fri, 13 Nov 2026 13:04:09 -0600
Message-ID: <445ce7d5-ce8c-4e0a-abb9-83920fe2ef33@ti.com>
Date: Fri, 13 Nov 2026 13:04:08 -0600
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King
	<linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261112214223.765100-1-afd@ti.com>
 <7baedb8836f538707d008b03e259780bc4fc8bd9.camel@pengutronix.de>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <7baedb8836f538707d008b03e259780bc4fc8bd9.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|DS0PR10MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: a4289cfe-3153-4a88-30fa-08df41b8ff3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|7416014|82310400026|1800799024|921020|4143699003|10067099003|5023799004|56012099006|261021121427099003|261021123027099003|261026121527099003|261021135927099003|261102123227099003|261009223027099003|22082099003|18002099003|10063799003;
X-Microsoft-Antispam-Message-Info:
	k8KqoNKRsF3WmlfeWUzdasmEBWpfwfBcG84fkKReCRPrxBzzJ4yH1Uh6zhPUXuoTQ718G2N3MtU8djPTJItVSRBy01sjg5SD6FnFb9L7jhnEXmkn5FwIfatkFyYxQ+NhkoAh+orWkOgOej2eHITqAUVYFDz5iPZ2vQqaotvVm0dtYwiAsdN53+dD3zo7DkJaBuYMtlOFC1rCWJClEMHQH/dL9VwukumyfChCBVwcigP2c0W7e4sP2OOODkSTjIvEroL0TbCMmoCYeHZTvDryZPggSD0Tgodspr2xdhLiYoo/B07FDLhqAmPN5RQ/okfjAZdM/LgrbsbLrayyT3Qt3lD2cjFuBl3H3ac/8Kw/xpkluK3Fzh/nHA+NicWnooycOUalZwF4/nd2JRsf4/onF3D86xZ4HkakqhaKRgrhFBOHfh0ODvMDE91MopcI9HtRbDbg+rNt6xACfx3dZGPMEUXcx2kYbkZOWdZEX05b4yIfLjq46GHybSQQfpKRm5xXI3p1dj2uWOmsv8UH7ZwwKUWan0Pb1a6/dkpGX5WQa6BP8hShdU5lhlaqHVvmywBwiVPS+dAAV0pjIyt7eFkLx6Nm29Y+ZPVS9seREolNWhRX8DpafamFZsDRzC1EkqSZKu2Z7VZigE7P79tC1VUP0nusf61mc82xx+loPIyBijZA8FXkdEJ+8A5hZ9XBWWaV3XSlp+pDEE1WKBsTTC8GLX55Y1pT/T33bpRdCob4OL84fQ27uKxaeen27geCHTXH
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(7416014)(82310400026)(1800799024)(921020)(4143699003)(10067099003)(5023799004)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261021135927099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(10063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w2ldNcOb8KZBvtEv7Ow5mlhrK5MYTb8bkYlr1RxhN3P0KOWPr8XBrgNtQNPHCYTYfsfgnCAJ3aTGxm33ElvxOj4IzPBui5amIQqAZjwLDdRqJeiHclWczKefQv/lUxPIw3VQssEHxiRtIY5tXdDH9BNgRQUsbbLGMM1kJWkptfnv9uYWqOCzBShIxSAOGm5Px8plr6WCSD/XejCJTNCYmnmKNPfQtduY4G1GZ91KxzFrB2VZ506fW3OKfAPwGXJILgQv8j5rJsdVspYI4+u774JtgP3oyVCgNxyIBb7zjkipPY7ELXuoI2WafNmxttxAXaPdR/v0Efy2/FVEJ4c7bULjPqygMXCasmDp5vNTneO/3ezKHVkAXgoeRCOJT2KK73I95e46IIMgEApEV5Qb/daDm0fj+biCbrCTGPwItNZSWpyf72UZBD1Gdqw9mYQw
X-Exchange-RoutingPolicyChecked:
	spXETPAgrj5HO1mEt4tseJEeVgteWcMCZY+7Vr3plH3H2xGhIlSQS3PU39B03nkh+5su7WzsOTyWcuBPvpLNsoYPvh+ORe+Rfz/dO02pi96CicjLpSvvb29cfWtqugXoFeXt2O1U8xl+nNDUtxfAKOQUOSuHPtu1RX7wNXp5Z3Txi/MYinTn8CSJ4AcMcSOEzUvWsGn/WiEnxgX8fH4rsloBnKZUpn8vmnBfORZ7vn+SglXV5lJ9kiG44O4CVvznTp0ziAItia5SMMdo2A5if3xh01z1RDjb3+wNJpub3XIHNM15kXx1zotSaweD2ce4BYFThmqX4QPeRkZlVM2DFg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:04:52.0467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4289cfe-3153-4a88-30fa-08df41b8ff3b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7127
X-Authority-Analysis: v=2.4 cv=cpgOAF4i c=1 sm=1 tr=0 ts=6af75ff6 cx=c_pps
 a=ouBVT1c3MJkzDXWVqRnxag==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=jAvk1HlfEtAzNKpL7CwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ohSjOhOp0waD3OouP50Vg1Uvt6CFOyuT
X-Proofpoint-GUID: ohSjOhOp0waD3OouP50Vg1Uvt6CFOyuT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7VgpA4HDTJZI
 eqZJRdBpt0kcPuBtQvfh9VdbeR8XC9tXjBF5exfqOClM72AeZhqa5qRTymAK3N34nHpx+7CZ6D6
 SjBnjcidUWybK8SSyme3oatZ9/EJTyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8MKoNzScksMB
 afn3KlhBis0qcgpgOV+Sl1Fnx6P1J/OzwAyy38/xRnA/gl2y2bpm+4WKjO3XKlu5KTNFZhRNN9v
 i5WUn4VEY4WV/7953J/bto3stKyzWDGSnG90vP2F1ijTO2PfVSUnudt7aIsDxzESvy9Xe+n/FKe
 INkWvtttjr905vL8rLu4l1TRZfROUYWV/IiMcrdzSZtJNoiVyXmUXjIKzqadQARCaAmWG9YqZLE
 +Kzel8wOVdMpPRF8pvaFAcCAaYFqavWfZ8uai/dPOm89gvCbLj3eDlobVRMb0Qpds05z7ip5rYI
 XMzgSsJ1/65T+33cQAzzgL6Lon97Hafoi9QdXR5ZrqoDObYG5MMY/Vd7flnywtZ9Ilbhfmxkf6A
 XlmeN2tkLBBKROToK/2QWvdeCozdR/XX7FGLNngQuWNjqTHO2tgd/joAh2GxPEJ6TPvvFAa6pr5
 uvmkGXqI0JlQ0bKpIaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

On 11/13/26 9:22 AM, Philipp Zabel wrote:
> On Do, 2026-11-12 at 15:42 -0600, Andrew Davis wrote:
>> Many ARCH_HAS_* symbols change some behavior based on what an ARCH
>> supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
>> for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
>> middleman and directly select RESET_CONTROLLER, and many already do.
>>
>> Replace all selection of this symbol with a direct selection of
>> RESET_CONTROLLER when it is not already in the selection list. In the
>> latter case when RESET_CONTROLLER is also already selected we can simply
> 
> "In the latter case" and "when RESET_CONTROLLER is also already
> selected" are saying the same thing. I'd choose one and drop the other.
> 

Sure, it is a little long winded, will clean that up.

>> remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.
>>
>> Some ARCHs "select" this symbol when they actually "depend on" the
>> RESET_CONTROLLER framework to build, in those cases the indirect select
>> could lead to broken randconfig builds. In cases when it is not needed
>> for building the ARCH code, these selections can be switched to the weaker
>> "imply" to allow it deselected for minimal builds without reset support.
> 
> Can't it just be dropped completely for those? See for example mach-
> gemini below.
> 

Yes, in some of these cases it wasn't needed and can be dropped such
as the mach-gemini case you point out. But my intention here was to
mechanical and not make any functional changes, going back and cleaning
up cases when it wasn't needed in the first place would come next.

Take the ARCH_BRCMSTB case, nothing in its arch code needs RESET_CONTROLLER
but if we remove that select, then nothing else selects RESET_CONTROLLER and
RESET_BRCMSTB is no longer enabled, when before it would have been enabled
by simply selecting ARCH_BRCMSTB.

Not saying that was correct behavior before either, but at least this patch
doesn't change any current default behavior and allows us to start to clean
some more odd cases.

Andrew

>> Additional checking will be needed to find such cases.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   arch/arm/Kconfig               | 2 +-
>>   arch/arm/Kconfig.platforms     | 1 -
>>   arch/arm/mach-bcm/Kconfig      | 4 ++--
>>   arch/arm/mach-berlin/Kconfig   | 2 +-
>>   arch/arm/mach-ep93xx/Kconfig   | 2 +-
>>   arch/arm/mach-gemini/Kconfig   | 2 +-
>>   arch/arm/mach-imx/Kconfig      | 2 +-
>>   arch/arm/mach-keystone/Kconfig | 2 +-
>>   arch/arm/mach-mmp/Kconfig      | 6 +++---
>>   arch/arm/mach-omap2/Kconfig    | 1 -
>>   arch/arm/mach-rockchip/Kconfig | 2 +-
>>   arch/arm/mach-socfpga/Kconfig  | 1 -
>>   arch/arm/mach-sti/Kconfig      | 1 -
>>   arch/arm/mach-stm32/Kconfig    | 1 -
>>   arch/arm/mach-sunxi/Kconfig    | 1 -
>>   arch/arm/mach-tegra/Kconfig    | 1 -
>>   arch/arm/mach-zynq/Kconfig     | 2 +-
>>   arch/arm64/Kconfig.platforms   | 9 +++------
>>   arch/mips/Kconfig              | 6 ++----
>>   arch/riscv/Kconfig.socs        | 2 +-
>>   drivers/reset/Kconfig          | 4 ----
>>   21 files changed, 19 insertions(+), 35 deletions(-)
>>
> [...]
>> diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
>> index f436a2009eca3..11e0e966c3bb6 100644
>> --- a/arch/arm/mach-gemini/Kconfig
>> +++ b/arch/arm/mach-gemini/Kconfig
>> @@ -3,7 +3,7 @@ menuconfig ARCH_GEMINI
>>   	bool "Cortina Systems Gemini"
>>   	depends on ARCH_MULTI_V4
>>   	depends on CPU_LITTLE_ENDIAN
>> -	select ARCH_HAS_RESET_CONTROLLER
>> +	select RESET_CONTROLLER
> 
> I don't think this is required. There is no reset controller
> implementation in arch/arm/mach-gemini ...
> 
>>   	select ARM_AMBA
>>   	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
>>   	select COMMON_CLK_GEMINI
> 
> ... and COMMON_CLK_GEMINI already selects RESET_CONTROLLER in
> drivers/clk/Kconfig.
> 
> 
> regards
> Philipp

