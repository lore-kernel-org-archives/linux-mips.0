Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575981;
	b=MCDFWHGf1/Yt/jFmd9jQue0/xd+p61D1N/6pa8+6i8kgsFKvhkWzCeCKZjuWj3gDTh4C
	 D6UzMSXZJqq4ncNZ7mSx+n/DflRaDavYqO4Fb4vri3nV5RJnwvzEUVSIvhHlzoJZa0EKf
	 9Ud44fPjL+qhtemPhFhwsVxSWxn5vhlgxtp9U9vwhNNif4C4ShCbilFTXmMJLqht1avA2
	 WsPwMnUrMavnXg+9Ogt/wVVTYtW3OwcE+11A5bqgG1Scbz/Q2JZBBbIn2J8dV1P6ZsaAK
	 x7tyCI7z78VFjvJJ/Cw8rlYWO5P4s5f2gSfqpC2Y8m0w8i0nDd8yxZLukr04laRiMrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nPp3tgjH3+3CXXrzYC5sLcWdnJG8JyAXnsch+Wdxas4=;
	b=KpjOKOJeELZyCwlyM1kYd92KTq5TClxLCFRvgYRIE95yXmk4Sid8wSkQcwkAVqOGcUb7
	 L9eNbavCdD0tHiqU+CC9J8s+uDKg47+coDBWOvB9Bfgjb2HajOfa+YaAArgZKEi6DYvnE
	 JWte5Hcpk1ThQBhQqlZah+0tnOAx1dpzuRFLrGFfYmZQizqJXs75W+0kBKE5WXkCCsbyZ
	 I1nDZA7D7Ruf/TAYSBw7WHcaGLWfr16NS7w1a9DFKXhNz1X/wBrT0m9/FpHYl9b/c0sYU
	 +P5cVhkNl1j4MUdghjdp+iqRhGBFFBLUb9YtbafX7lFPcGjBsQc//6iw1GQoyPAPWdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=R2wXxCT7;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=XmIhOPf0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9D606A8A5;
	Fri, 13 Nov 2026 13:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B9D606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=R2wXxCT7;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=XmIhOPf0
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCWaCo2027891;
	Fri, 13 Nov 2026 07:18:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=nPp3tgjH3+3CX
	XrzYC5sLcWdnJG8JyAXnsch+Wdxas4=; b=R2wXxCT72uJJxLRkogj4g+NRIUspx
	I3HIMIH2qrrZnRWIw6TEiQA0uk59A8xNZtsz143vnJBqGVJ0qsqzIfQZ9bFfQ8xJ
	FwjY0JEt1YKukK9owiyTQZpEWy8S04hZrYUD/ukNZKfbO7DL6WEHDPx+krVWXpyl
	v6KOiXsJxAIZpfoffG8tHWawolmmHWuerDtPS1nsfOAK6Fw9vy6BxVgLfNkH6UzZ
	KAYdJIlFboXClTEecQHkoIMXTJ1D2tltLVv4Ku3xv7RFhPjaemOSSUcRm8ZI//TV
	BKQfLiCxjMyTpc5VReQ7CoJ4mELGopsKGKdbKWGehUrof5nyKTpdwK8FA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwg9rwkxc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 07:18:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAAMV3mPqrk7JbboBW5K5z3lDvfAwQ0VTJi+YkYr0x4+zSYZMgeCG1Lztti9ecjpyhi2uRVprQxxZYX/duA41aShvzl5yt5+sG3Av1eU1+PwsQH/m459vR+FTXCGT5/EwGIdcSe7HNUEJmW9PruRF1Y6ZKssbNKZVJG66LpKWZDbeYFWvFbZBoA3Qx25qggeFRPgp94OGgftAlk7yc/jMNFrr34uyIWZ0x6F9IZMtxH6DU4sUuxrmAxQKg76uUCtrsSeUvwm9RZK+M93MJuTx7omonswKkMmr2EMPrBEiTkHlGoUGPZ+DrlTzW4r48q6IpXy8XvwGwkTp4Tfk/wSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPp3tgjH3+3CXXrzYC5sLcWdnJG8JyAXnsch+Wdxas4=;
 b=QYvZgmnF3vVqJZQ/uwU0IwBXc9yw50QPR4RPSlmdWrSGOzOyFYXs6IUOoa1f3AKKvXJbeFP4/NiWxHzkkOk4QhT8GCWSODpbtmRvhwZ3d2lwwCMJ5aFDxMKwCx6Mg84u9AxIt5y7/zSboTRG3XgBh7nTVKH1IowyGyMWRxoUaDeG3sejUtvXP2fr8oP6dGI6wrhyOA4ZOaSDmwJkRKoZlgEaYvlNc7rGkrQaIOznxVL1xlLTcUGI/3hvZOSveYZBUzdLI+Ha+zjLCJfx3Z1CORxpwK6vPAhGojvcwPa7MCtH1441e2zegCXDN5pv+Mvw/cgPXuLi9JRZAiNP9E4lVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPp3tgjH3+3CXXrzYC5sLcWdnJG8JyAXnsch+Wdxas4=;
 b=XmIhOPf0DKYuuez5f1Qtgc9EaiVF43IdV63t5KyUF3n+k6bdN10aZbdMKMNuYwNGOJhY8Ou0F5cPiGrMpB4IFs946SmSI6p0Sk/k7Gzw28lf7CAo7+qdVndA3/I4sYjbcDyMrnwz/3glHqLCBEO90bctiJY+PvzS/2DRvmY2+9A=
Received: from MW4PR04CA0135.namprd04.prod.outlook.com (2603:10b6:303:84::20)
 by PH7PR10MB6252.namprd10.prod.outlook.com (2603:10b6:510:210::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 13 Nov
 2026 13:17:52 +0000
Received: from SJ1PEPF000037B5.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::9c) by MW4PR04CA0135.outlook.office365.com
 (2603:10b6:303:84::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 13:17:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000037B5.mail.protection.outlook.com (10.167.244.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 13:17:51 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 15:42:24 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 15:42:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 15:42:23 -0600
Received: from ula0226330.lan ([10.249.37.26])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ACLgN2v1653138;
	Thu, 12 Nov 2026 15:42:23 -0600
From: Andrew Davis <afd@ti.com>
To: Russell King <linux@armlinux.org.uk>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Paul Walmsley" <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
Date: Thu, 12 Nov 2026 15:42:22 -0600
Message-ID: <20261112214223.765100-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B5:EE_|PH7PR10MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: b212a7e7-de74-40f8-07b9-08df418884f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|82310400026|36860700016|921020|56012099006|261028144727099003|261022105027099003|261026140227099003|261021121427099003|261102123227099003|261026121527099003|261021123027099003|261009223027099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8AB3GqfYfmYtBedxT+Ft5STN4tg3cWRwaLsBa6coAMS0YGTEmZ0aRzUy/p7yA7/R8HgpaDKtH6B9fiE2gHpZsvsu/zgjRNmjcT3QcAbxdr+l6DtcFLWaJ03+EOzWcuEZiW6QBsuUfrOv3H9SIUW49WBfoImC9zCBCeen0zktzEz8An11Se1OmC6ONpST1jH2PFnq/SnKskUQ3ONf5oTfd7f65qIxfkVDRMQEXzKDkMmG1oI7ykYMNJNw/wCIGUs95DrtWun5p9AaJChkltJ9CTk0MLO30LmpWr7qlxqNCVwtY7NLNmPOXKuGpH1FipBsNDueN823AMyYj08WetGU+XO1Gp/oEI9IUyi8xnvfIuwMch1/TofPY2PeWwbrWlvf7czJ8KBXybfYRUDjAgYqZNsgZUZSxjqRENWdV4uCz8iQtrZNqWXD17vd/t3TbDaq0DxzSaiZAKyq2JX+BaLrD5O87yYPGw18gWeCA9Id+XL15CInv/fwtUu1mhu5aef2hetaMFeSQ7E2l39tIZ7vj9eZ/GNaUpICDuIaPilQKRBI6iKNVadJviK4usQ6W4ippCkjHbmAZq78t+b6G4AmGikpSpwBV2R+UMEYmX/4i2wIGuSBGZGE7sFICgPFjqBdkBmzCvWP39rixm2a5l2f5GBDxA0mFuDwGw49JdYXEvBb0A5o+EY3UIaS8Bk0y/0pON5CWKjQwnupiQH0EmGW1HOeZucVQIc9MODI8xYF0ppu6PSlFlXE5TvYF83v/4kL
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(82310400026)(36860700016)(921020)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261102123227099003)(261026121527099003)(261021123027099003)(261009223027099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SXy0sylydb1nx8sWTujDu1QbASNu5DBpIu4qQb+uo6BXFc/1q2YKl9ELZ72y9oEGkX+zbdhWfq8XsK7N+o1J9NQZ5liH8Qlx8TKs+g4tcbWgTQ0wbtqR79UtOjccRo+rdHVqVLm/P3gYmcT5sknSswYDd9gHzcY/MUFmmPE3DHaaV0E7glHqye+PjCDyIP1NqBnxts3jClWfsBItXvgU2TLGsZbbWPIivQ+qUp3fQPVJPY2khcrxu4WfUebxUajMtIIEOy3gh5i6d4F3ELCsTUCaLMUMvkEmnMyE9GQAhXgALG7oHtJeDu+0ThShdW80FyG+gm8LJ01bvY927yeUU71tK/BcKG7o22RHETFHcu9GuIjmL9FzBz7vq6LpLeD+Eib6/Jtr9v5F7w8t2aRG8r8F9NrgRPlV0q/mt0WU3c5teJdCisU4IvCjaUtt7F1v
X-Exchange-RoutingPolicyChecked:
	M7cIDMaGgHNx3Xuuq1qFCXyoHZ72ezqXcHNHYhHieDDpXQ1OET/5WtX0mrskQ49ZMb4DgX9puwtAiDGAkRikCNDCiqgaAh/TuVMyjPLULpwlO0sZBGX9oysrLadJLq3CtsAbBkghn0gb2v3JpWajWJzV08ybk9sWqwLberqkjqiU50Qak/kCe7aOHtmtcnOV7SCd9iOjr7+aXrrhKcdWsm54aFeEH4WVvQ3/Fjoa77j1c6J2arcaZcLXirLzDIZBoa2PCmlbJqcOmbJXtWxpCAVCq2ZurSJW1Cv72ZetRINyPnOQDKugZMEHJIXSawlUL9LCvuFV613hwQr3JT5bxQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 13:17:51.0594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b212a7e7-de74-40f8-07b9-08df418884f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX56QVT0GYKW7Z
 ckzpDT3yaj1mVt2EG+2vkivUHbecVfEp5JrN3kU91lYhIdwFI8THc9RXfkg1UWSQnMg0CHF6rfD
 Y2TxIHDPgNoxny4YyCY6sDH93wz3xfvEcO1N31laCrnL5P1n7at5EwNQc21ghl3GZMeVj/IRVy1
 wayYzxKG16XbntV5nlD2AA5077xbepv42J6KN4CB418sbs8WL/kf+CrtrA2jQkrYef0+ezXO4tQ
 +0PoQrbnOJXQDmmzngcyDhxTQ9LqUG5tvt16Ak/Mu4/bNHxxFusrZewtpbxPtFSK/K3zMpY7ihm
 9gd2xNtx5ADkjaTcxz7AobNUfAnFk/INgm+KeA55PhALWWo/pZelKFRBYrMiLezwlxueh3zfTzG
 WnXidD4xra7OF4vDzkFhOLhR5RZpfQE+hxa5nrNVemQWL1XNAgEdzlqeO1Nz5LYPYWnCiLuut26
 lk4Xo2eFB+J6TwhLnfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX7kLz+/qrWPXr
 80aL6D1/wCWRoUheylBCyU/Sy87u0axewZC2mkwKNjXl6DUNN+2pukhs88JddhxR4lOsqb3RL5d
 om511w0NTwUUODOZcndB3RRIHfsSil4=
X-Proofpoint-ORIG-GUID: XDqTlLgjspKs7yzx3UQoUPXeolzNGWW_
X-Authority-Analysis: v=2.4 cv=b7oncdGx c=1 sm=1 tr=0 ts=6af70e0a cx=c_pps
 a=5k1muW5XIJfqWNzrwyhXkQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=2QSx6drZsS2ta5UW6hwA:9 a=XAbBb_B534XbvIaE:21
X-Proofpoint-GUID: XDqTlLgjspKs7yzx3UQoUPXeolzNGWW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130052

Many ARCH_HAS_* symbols change some behavior based on what an ARCH
supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
middleman and directly select RESET_CONTROLLER, and many already do.

Replace all selection of this symbol with a direct selection of
RESET_CONTROLLER when it is not already in the selection list. In the
latter case when RESET_CONTROLLER is also already selected we can simply
remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.

Some ARCHs "select" this symbol when they actually "depend on" the
RESET_CONTROLLER framework to build, in those cases the indirect select
could lead to broken randconfig builds. In cases when it is not needed
for building the ARCH code, these selections can be switched to the weaker
"imply" to allow it deselected for minimal builds without reset support.
Additional checking will be needed to find such cases.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm/Kconfig               | 2 +-
 arch/arm/Kconfig.platforms     | 1 -
 arch/arm/mach-bcm/Kconfig      | 4 ++--
 arch/arm/mach-berlin/Kconfig   | 2 +-
 arch/arm/mach-ep93xx/Kconfig   | 2 +-
 arch/arm/mach-gemini/Kconfig   | 2 +-
 arch/arm/mach-imx/Kconfig      | 2 +-
 arch/arm/mach-keystone/Kconfig | 2 +-
 arch/arm/mach-mmp/Kconfig      | 6 +++---
 arch/arm/mach-omap2/Kconfig    | 1 -
 arch/arm/mach-rockchip/Kconfig | 2 +-
 arch/arm/mach-socfpga/Kconfig  | 1 -
 arch/arm/mach-sti/Kconfig      | 1 -
 arch/arm/mach-stm32/Kconfig    | 1 -
 arch/arm/mach-sunxi/Kconfig    | 1 -
 arch/arm/mach-tegra/Kconfig    | 1 -
 arch/arm/mach-zynq/Kconfig     | 2 +-
 arch/arm64/Kconfig.platforms   | 9 +++------
 arch/mips/Kconfig              | 6 ++----
 arch/riscv/Kconfig.socs        | 2 +-
 drivers/reset/Kconfig          | 4 ----
 21 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184ab..dd039f349e45e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -473,7 +473,7 @@ source "arch/arm/mach-zynq/Kconfig"
 config ARCH_LPC18XX
 	bool "NXP LPC18xx/LPC43xx (DEPRECATED)"
 	depends on ARM_SINGLE_ARMV7M
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_AMBA
 	select CLKSRC_LPC32XX
 	select PINCTRL
diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 2e118b65f93b4..e89d515c0c378 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -191,7 +191,6 @@ endif
 config ARCH_UNIPHIER
 	bool "Socionext UniPhier SoCs"
 	depends on ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GLOBAL_TIMER
 	select ARM_GIC
diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 24bc6e18d8067..d91629f4ffc8d 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -182,7 +182,7 @@ config ARCH_BCM_53573
 config ARCH_BRCMSTB
 	bool "Broadcom BCM7XXX based boards"
 	depends on ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_GIC_V3
@@ -229,7 +229,7 @@ config ARCH_BCMBCA_CORTEXA9
 	bool "Cortex-A9 SoCS"
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_764369 if SMP
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_GLOBAL_TIMER
 	select CACHE_L2X0
 	select HAVE_ARM_TWD if SMP
diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kconfig
index 01861fa72c971..2447f62da52ab 100644
--- a/arch/arm/mach-berlin/Kconfig
+++ b/arch/arm/mach-berlin/Kconfig
@@ -2,7 +2,7 @@
 menuconfig ARCH_BERLIN
 	bool "Marvell Berlin SoCs"
 	depends on ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_GIC
 	select DW_APB_ICTL
 	select DW_APB_TIMER_OF
diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
index 812b71dcf60e0..5573a8e90a8b5 100644
--- a/arch/arm/mach-ep93xx/Kconfig
+++ b/arch/arm/mach-ep93xx/Kconfig
@@ -5,7 +5,7 @@ menuconfig ARCH_EP93XX
 	depends on ARCH_MULTI_V4T
 	# CONFIG_ARCH_MULTI_V7 is not set
 	depends on CPU_LITTLE_ENDIAN
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARCH_SPARSEMEM_ENABLE
 	select ARM_AMBA
 	select ARM_VIC
diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
index f436a2009eca3..11e0e966c3bb6 100644
--- a/arch/arm/mach-gemini/Kconfig
+++ b/arch/arm/mach-gemini/Kconfig
@@ -3,7 +3,7 @@ menuconfig ARCH_GEMINI
 	bool "Cortina Systems Gemini"
 	depends on ARCH_MULTI_V4
 	depends on CPU_LITTLE_ENDIAN
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select COMMON_CLK_GEMINI
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 3f0521c652cb0..d3b603a4a8b3c 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -33,7 +33,7 @@ config HAVE_IMX_MMDC
 
 config HAVE_IMX_SRC
 	def_bool y if SMP
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 
 if ARCH_MULTI_V6
 
diff --git a/arch/arm/mach-keystone/Kconfig b/arch/arm/mach-keystone/Kconfig
index de69cc2dd4831..aeadb7a57ec1e 100644
--- a/arch/arm/mach-keystone/Kconfig
+++ b/arch/arm/mach-keystone/Kconfig
@@ -5,7 +5,7 @@ config ARCH_KEYSTONE
 	select ARM_GIC
 	select HAVE_ARM_ARCH_TIMER
 	select KEYSTONE_TIMER
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_ERRATA_798181 if SMP
 	select COMMON_CLK_KEYSTONE
 	select ZONE_DMA if ARM_LPAE
diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index 8c1d4402fd693..d709d2b603a5b 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -18,7 +18,7 @@ config MACH_MMP_DT
 	depends on ARCH_MULTI_V5
 	select PINCTRL
 	select PINCTRL_SINGLE
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select CPU_MOHAWK
 	help
 	  Include support for Marvell MMP2 based platforms using
@@ -30,7 +30,7 @@ config MACH_MMP2_DT
 	depends on ARCH_MULTI_V7
 	select PINCTRL
 	select PINCTRL_SINGLE
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select CPU_PJ4
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
@@ -47,7 +47,7 @@ config MACH_MMP3_DT
 	select CACHE_L2X0
 	select PINCTRL
 	select PINCTRL_SINGLE
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select CPU_PJ4B
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 79f8afe3a6bfa..65fbaa63a79b3 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -97,7 +97,6 @@ config SOC_DRA7XX
 config ARCH_OMAP2PLUS
 	bool
 	select ARCH_HAS_BANDGAP
-	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select GENERIC_IRQ_CHIP
diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index c90193dd39283..3dc3b5581947e 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -4,7 +4,7 @@ config ARCH_ROCKCHIP
 	depends on ARCH_MULTI_V7
 	select PINCTRL
 	select PINCTRL_ROCKCHIP
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GIC
 	select CACHE_L2X0
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index 528c5c1368c37..fc4a56291bd78 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_INTEL_SOCFPGA
 	bool "Altera SOCFPGA family"
 	depends on ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GIC
 	select CACHE_L2X0
diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index e58699e13e1a5..22d169a2277e5 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -9,7 +9,6 @@ menuconfig ARCH_STI
 	select PINCTRL
 	select PINCTRL_ST
 	select MFD_SYSCON
-	select ARCH_HAS_RESET_CONTROLLER
 	select HAVE_ARM_SCU if SMP
 	select GPIOLIB
 	select ARM_ERRATA_754322
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aa..00dab551bcce2 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -7,7 +7,6 @@ menuconfig ARCH_STM32
 	select ARM_GIC if ARCH_MULTI_V7
 	select ARM_PSCI if ARCH_MULTI_V7
 	select ARM_AMBA
-	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
 	select PINCTRL
 	select RESET_CONTROLLER
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index e015f2497111a..9d0e7d8dc5d95 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_SUNXI
 	bool "Allwinner SoCs"
 	depends on (CPU_LITTLE_ENDIAN && ARCH_MULTI_V5) || ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
 	select GPIOLIB
 	select PINCTRL
diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 3a06ba263e345..c85d8c6d34954 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_TEGRA
 	bool "NVIDIA Tegra"
 	depends on ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GIC
 	select CLKSRC_MMIO
diff --git a/arch/arm/mach-zynq/Kconfig b/arch/arm/mach-zynq/Kconfig
index 05be5aa9b4028..e3d7649b9899a 100644
--- a/arch/arm/mach-zynq/Kconfig
+++ b/arch/arm/mach-zynq/Kconfig
@@ -2,7 +2,7 @@
 config ARCH_ZYNQ
 	bool "Xilinx Zynq ARM Cortex A9 Platform"
 	depends on ARCH_MULTI_V7
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_GLOBAL_TIMER
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 49dcd7be82cef..bee8766c1312b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -17,7 +17,6 @@ config ARCH_AIROHA
 
 config ARCH_SUNXI
 	bool "Allwinner sunxi 64-bit SoC Family"
-	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select RESET_CONTROLLER
 	select SUN4I_TIMER
@@ -99,7 +98,7 @@ config ARCH_BCMBCA
 
 config ARCH_BRCMSTB
 	bool "Broadcom Set-Top-Box SoCs"
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select GENERIC_IRQ_CHIP
 	select PINCTRL
 	help
@@ -353,7 +352,7 @@ config ARCH_RENESAS
 
 config ARCH_ROCKCHIP
 	bool "Rockchip Platforms"
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select PINCTRL
 	select PM
 	select ROCKCHIP_TIMER
@@ -376,7 +375,7 @@ config ARCH_INTEL_SOCFPGA
 
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	help
 	  This enables support for Sophgo SoC platform hardware.
 
@@ -405,7 +404,6 @@ config ARCH_SYNQUACER
 
 config ARCH_TEGRA
 	bool "NVIDIA Tegra SoC Family"
-	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_GIC_PM
 	select CLKSRC_MMIO
 	select TIMER_OF
@@ -442,7 +440,6 @@ config ARCH_THUNDER2
 
 config ARCH_UNIPHIER
 	bool "Socionext UniPhier SoC Family"
-	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select RESET_CONTROLLER
 	help
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dac3ec5120a34..53bde6032076c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -228,7 +228,7 @@ config ATH25
 
 config ATH79
 	bool "Atheros AR71XX/AR724X/AR913X based boards"
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select BOOT_RAW
 	select CEVT_R4K
 	select CSRC_R4K
@@ -250,7 +250,7 @@ config ATH79
 
 config BMIPS_GENERIC
 	bool "Broadcom Generic BMIPS kernel"
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select BOOT_RAW
 	select NO_EXCEPT_FILL
@@ -472,7 +472,6 @@ config LANTIQ
 	select USE_OF
 	select PINCTRL
 	select PINCTRL_LANTIQ
-	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
 config MACH_LOONGSON32
@@ -690,7 +689,6 @@ config RALINK
 	select SYS_SUPPORTS_MIPS16
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_HAS_EARLY_PRINTK
-	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
 config MACH_REALTEK_RTL
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c49838..723761037d0d5 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -112,7 +112,7 @@ config ARCH_CANAAN
 config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU && ARCH_CANAAN
-	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
 	help
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f3..4e37c432823da 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -1,10 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config ARCH_HAS_RESET_CONTROLLER
-	bool
-
 menuconfig RESET_CONTROLLER
 	bool "Reset Controller Support"
-	default y if ARCH_HAS_RESET_CONTROLLER
 	help
 	  Generic Reset Controller support.
 
-- 
2.43.0

