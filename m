Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197031;
	b=LD03UeZIkrYSPM4SjRUJynOepjj6/ONHuFntp0XM/GAQ/eBn+Dc3Wof0+zqqjY5k4sdO
	 W+KLZBcOLpyPdV4KQRGzjSiNFFaT3z5gFaMoJ4GGGraMwS/u5DwfDfPWJhTNPGVb+Dcwo
	 0PAXLSCdMy/+j+4vLj7jjkf2jD/wMDq56aWrDgmjy6iCytsaX8EQAY7Yd3z0UOHAAMAw8
	 i5fekhGiCSX2r614MCrFJQgeKAACbhCe7GZuwNWHZPw3AoiXKmWVKSijZKXCPnEndnoT6
	 wl6pqzAr8V0G38MgaW8Vk6VhFObzRsy3GkU24YoPHKc47y+DF/xokopR6dWW7mgCXOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197031;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gyp1c5FAxZz0FHF4ZOcLuWMCZ2b+IS1+X17fpydg/eM=;
	b=wearUIpr/skR4Jgsxd5nJ7f/o9gRdTsg5LvBJLmACFksTE3XWd3DP+j+uxFzihM3J13L
	 lmosgNd8CSxjBT2k4Epz0XhpxrQm6MlUZ8Yu15+YP0VtaxPZYue1Ooiyv/cHpbvPLKkYp
	 YFtky76SApX8ssrnvdyE230HUAU5q4ub+GmnYJvEH2dB5utEtucKKKOy3qkjTUVrc23wm
	 5UbCu/NQhP0Yzgtcbnqq5d7QxU1s3DkYg9N14prrMtjFCAThizC9K0De6/vu5WMsd5RES
	 0Hq3UENc5K8HcO7IPHwKfML6L3vK6aNZThB94g/a3pEN5llLW9JHMO45RiCaLCx6teA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=OwJuUyBX;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="kDn/ORIi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D07606A331;
	Fri, 20 Nov 2026 17:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D07606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=OwJuUyBX;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kDn/ORIi
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKEeVXk633078;
	Fri, 20 Nov 2026 11:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=gyp1c5FAxZz0F
	HF4ZOcLuWMCZ2b+IS1+X17fpydg/eM=; b=OwJuUyBXNyo39Xmw7JLqDclRsLAd7
	zQZaBa4mBhkBYGo/aLFpAKiZPKR5pHDvP6XmaPtKeL8EQXCJFKA3FNhDOXoO29wY
	JEuUmHsDfEAjzfpHDuTZRYepUNWCGwK3rPO7tU6n11bsBj9cSFoa8zWmxxRR5nLX
	ihUzk5xG73BnPj0YeacZJHHdxs1PIT+/IfTylLt5oiUFZEr3oe5pZ671FDfoFIfG
	tztNugcTFeUcRCtJxVYq+TS0Bu4oCrJk3GUpdj0AX3W/m+u9dhuE0YW+ct+IGStX
	LwVmcQUzXOXzSJcGu3/PnLzLWS+/p66VWBf7VVPwlUtfenVN6MFBODuig==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j2k2cjxt3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 11:48:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiKTfi64D2FsrozKSfNz8i1DEho8rtH0Vzo+6gU530VDuRlpaSYwdllMjMKYZ8I0mrZMgiEo5jolsWlcr3Odg5USBie7eAsbBh3S5BaobRlaC9ofkyJ/9ehBMZaCmseW3XrfY4Fh6iGh5qW0LmdZ9V+oA3/auctv9ip0flpfDw5q/dnylJXLzlYy2cCD/FsZNyljAtKuraGi2ofydgTagbV3PZHRbArfMrZKFuuEpqhlA57GU+8pwbsRb4Tm1kC64vz0308v47FBM9JoF0Vh5b8EPB6ERwaAC9FWHIc/7gNkg+8AAbyZ4wv1R96Q13tY9mKsi3mBLTF5gkENkPvUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyp1c5FAxZz0FHF4ZOcLuWMCZ2b+IS1+X17fpydg/eM=;
 b=KyFnjaQBn3qh9xzghgBCD32og8f0+Xg+Brpy8ELJqQsQVPnJ07Qdal8mfWGQBdpUyVheFYleiQ/cjjR2PQlMmEmap+hmHqqOjeLgXCZQ1zswotHPNpHq7kqJFNq4qP+wgrMsUDyWU7gNaLzk+C57R1zi9PFdjJADUbAjSYbuUqtei2HagtfXTqQNQ2H7bCTV8pYlAfWsWRREud+W6MAT5YrrImzYU4jTNCoHu6UIwkEMWBMJNoIUjqQQxzsg4iYTAZ9Y6RrLmN5bwuZHOrkTb5T2uGKQRDGb5Uz4F+Fo3sj2iiMcGU/gXu3MLlXSrNbIlV5HGNIofW2BiGOSCv/diw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyp1c5FAxZz0FHF4ZOcLuWMCZ2b+IS1+X17fpydg/eM=;
 b=kDn/ORIiokTCMRmqbyiChrWKjhTInLwCgazTiqgSNVSq6KQUv1oHjWH196bnKX+nkIEWg1+qMlBqpnWS8mp4IguZ/8s9BZEt7xNzqsBlyFJVJ/Ps+9yKZ7ik2JpxQf2aEocDm1ykioUxu+itWPVtq3iJlRlWx7cVTWrMSuCbYzY=
Received: from CH2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:610:54::28)
 by IA0PR10MB7666.namprd10.prod.outlook.com (2603:10b6:208:481::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:48:42 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::5f) by CH2PR11CA0018.outlook.office365.com
 (2603:10b6:610:54::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 20
 Nov 2026 17:48:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 17:48:40 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 11:47:52 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 11:47:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 11:47:52 -0600
Received: from ula0226330.dhcp.ti.com ([10.249.33.111])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKHlpGe1568092;
	Fri, 20 Nov 2026 11:47:51 -0600
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
Subject: [PATCH v2] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
Date: Fri, 20 Nov 2026 11:47:51 -0600
Message-ID: <20261120174751.49247-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|IA0PR10MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b1fc69-2e65-45a7-3605-08df472e8354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|921020|10067099003|56012099006|261021121427099003|261026121527099003|261009223027099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261022105027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2zmhZmN/Lhzzqquvek0sfbJ6ct4UAZppiWgLcVCsIQESj63yXbCcaYaVhkH5gcwtvdgYIx1NPRq/ydkIs4/4pHxY1WIS6+yxlWvP4Fgn62AokCicqPF3a1CdJzmhFX9zNHatliEj49LZ/iCrziYkFfsVi3KdB4FJUNaeUm+Nkli8dm5MBP8B1Q6MAuDQO0NI/B2mMLaJGxOfe3tLlGVyX0UbRXkNhPVQAgo0EsH/Pr4sFLrWHyJ4VOmD55UBLnq9J228Y4upW482jXPUcP4oQuh3asqBeebSTDV+kuom/NX2m2FlpXp6kYaQjzNTbJCen01fM91V4C7lZJnVCQm0+daxCsbHilB3pCI5l/TZ5qwJ989sno++b4bcCekU9xpS1BSnnR0DPGQojBSB3Teq6zi411aN8p1qYqiBWHxCGcGWMjM6RABeL4XKsUwJSQzUfa34ZPUgD9se3a+I5eCumYxsETKvtyH8g8mV5jgbbZ8XH1heDNfXkNQr10FZBXydF62BIb/268MhdxMrUC31PkgOZBBkK150lOQ/0eKySGNFTUJ/jjA3RP5By8wp2Pqw0qTBPkLqo4qLMcAEvsZO8uAF/5EoASWFS+28iMqMBE5OCJxMExD/PhCqBUzW6D3fz52v6OGLYYFTokZ68r5rlZhuf2BHqh5ohOOTgDevkW2FfSrBNP/0xutGf1s/cmi2jMAZ/7g7txWM2zSXMCPF0D9F97FxxAUXgy7acpRViODAxF/LylP1V3JiX+joaoeL
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(261021121427099003)(261026121527099003)(261009223027099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PezZrjROWJuFbGhIcLYA086MhuOsbcyzoHwRgh3TjLaV+lPk3XND/hJd+S6HWAyegMTRoN9J1062ZKbHtHk/n1T6wloSz88T1LWOv1ti9o/3k9Tn3VM1/klMv58tOQo+/RvVV8KQZxb2swuzBgHTCI+op+ZsQ7fuayfFFLxDel7s7Mu7FjigBcwR9B9eSYzNxNlWOuhOngkHg4T7SfJ3bJawxmD8IhfZ0QLuvcR1E8bBUBFnDr+yTs5vtJj/WNNXuQnbCo1fWBBmuUd3vdXCAybTMDzSR5+Nyj+HFNIR0DEgwI52yxKrd7N4ay3u+Tn9viIAEx0xpDfZNtSs3B9YJza1C/RCMhhYGLL8WHeTTgRmpfCnH86J1MPDPd4c5HlHc1IVTpDBhcZAervgcXGTMcK4HgkOtjRbRd/vOnmO+xuafTG+VLH1xFwzZH4AtoSN
X-Exchange-RoutingPolicyChecked:
	jrqHJwDe41NQIPBkyustzA1htqZDTulegS7Wl8pNy+mT30BJqmWjjRShqqa+c7x3vSY6FGpvMPrwdWENIvzwfTHzGNKr2MCVd3sqYYgJaZTbB27lMfYG65sgcBrmacdWl99qqys2wUTiw9ioHiOZBIw78ayzuM+i8i2TwVc8VRitx08D7PaKSU6e4xz+DQnmqy1PxzwgOUf9GwoIhQn/N1mrOf8Cl+h11hx9HX6+OQ5ZaDeyaGupE9bGiiovanlD1H1I/0hLEBOGpFfQNXhdH/P8h+JoVbHPXPI6KPQOhzq/sJlk/C00pcQoyg0Oinz6g7fjc1PXwF5pZvL/IaV9cw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:48:40.6033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b1fc69-2e65-45a7-3605-08df472e8354
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7666
X-Authority-Analysis: v=2.4 cv=NYZzRGD4 c=1 sm=1 tr=0 ts=6b0087ff cx=c_pps
 a=MXKEcm+r4KK8PT7sjGsI9w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=2QSx6drZsS2ta5UW6hwA:9 a=XAbBb_B534XbvIaE:21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3MCBTYWx0ZWRfXxgvjU5iVNpd3
 YG2AUMoJgND2vVr9876rUUMjwMMLrlU9dLWtkhgpf6pad/ph1b9Cyzcy9iPmMi1ojgJ0jvIwy+v
 8qBrWECP1WR4CC5AR7q5pBYqbOdor7iK67L8fdGv40U5UzhsnYEvy4X0OBlelBAfokdpv8Zjk33
 OTaiCH4/5K9EUCH7lbTshZGKiCoZChUNYfX7YwfNpBmjBTJM5iesGWLF9znw25+HbUk7VourK0Y
 +Ttp8dlyuMQYh621QUuMuRAM9ZI28aexIAT0ab1Wu/wVLn5fMnEYej8n+PQnqmXmE/eT/IYy1zE
 riykB3KLLoW2LmT69gSz48V881fo72CKTCmzq82hIy2UaW09Jj+MJ4+ZRqYdbPp809l7b3L4zV4
 nxUNVV8RIWQthNa9u/0yMQenQ12/5g3YGcC1796XXxCkhpiBd2nMVJjMTnNix+QFPXSGqERdag4
 w1yZ3+QFv3T5u7rWDFQ==
X-Proofpoint-ORIG-GUID: CApVzdqMeYs_mLBfN_TvAx7Luqb4tuYU
X-Proofpoint-GUID: CApVzdqMeYs_mLBfN_TvAx7Luqb4tuYU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3MCBTYWx0ZWRfX67iroLHWnkRu
 gDTUeh+1Eq9uyD8+tjzc3TWiNTuIJYzVXc/JMyTF2NJG2KcErIU8gL7RKuiBwZi2SCFp90Ikmie
 jmnP+WGbz6DL7ymp3zi4/ksWHRnvyb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200070

Many ARCH_HAS_* symbols change some behavior based on what an ARCH
supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
middleman and directly select RESET_CONTROLLER, and many already do.

Replace all selection of this symbol with a direct selection of
RESET_CONTROLLER when it is not already in the selection list. When
RESET_CONTROLLER is also already selected we can simply remove the
ARCH_HAS_RESET_CONTROLLER without changing existing behavior.

Some ARCHs "select" this symbol when they actually "depend on" the
RESET_CONTROLLER framework to build, in those cases the indirect select
could lead to broken randconfig builds. In cases when it is not needed
for building the ARCH code, these selections can be removed to allow for
minimal builds without reset support. Additional checking will be needed
to find such cases.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Cleanup commit message as suggested by Arnd and Philipp

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

