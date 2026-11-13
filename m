Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587661;
	b=DdOlPY0toX0wMNUdE3OkjXMZeMHJfKp07asePsxHx8ZEVP2+Vu4yDj4HDpLiWmnZIZCf
	 uXqtVkK+iebkjTscGkya62GLrdPabFeRZ4a5EmDvtlWSzPtBGsG9IePb63/Bglr36B7gB
	 ujdlNtcMxtGRpVAEtgRsA8olFEYAw21+3+vL/nnz8tqXvftjpo0fp7taeDkB3r7FsWSpL
	 cApxg5ZvjumfEp65v70LIQAFsMGl+kApvFNBKG0D9DZWLM8vK38pBYX1W40p1iBf8W9ps
	 CnC0kc5oNsVuAyMH7hJnrjs8P5tV7QJcX+0dBfwNtkFG7EVhtyeV1HMMhHP92tAOYrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587661;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wrv6WxaSkcIQhwvdW2KW5j9DQg5a7d1eob3zqTapfPg=;
	b=X9lTf8NFuOC6H0lrYbEDYALYOAcb5jWsi2Wi8y+OsXNZe+wNdLdok2wLdY7zSc9Pe9/L
	 vhvd7XeoVMwKd7csfJgYCskafj+NxHyXxv5Oza/45kuZQS4+T+tyKxkiXXGmGc4aMeiAt
	 3L5zx0USkOTzy9b7uQnQ3FU2SxDiGzZP/LnvysO3j+pS2We6CTHUay7dXH/20Wl5RNCHD
	 tvHmad7SONY4bt4j/NffSju+wPmad8izPy1IsrIXmQOgAUjReA2wqLgv0WDYHiWjYC91U
	 2+jux18yzvdhMUHytgYSgUTMpoEdJrC11XpFu3vYOXEytq+G7UmEKPUlERjfkgShGWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ao6iHF0f;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sjMepTuh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4A606A330;
	Fri, 13 Nov 2026 16:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B4A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ao6iHF0f;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sjMepTuh
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRlbD2031413;
	Fri, 13 Nov 2026 10:33:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wrv6WxaSkcIQhwvdW2KW5j9DQg5a7d1eob3zqTapf
	Pg=; b=ao6iHF0ffEGOANxHmkLkWjSvXdn54KjVTQxVGpn9GLCxI5E3eV/4PY96T
	7/O+w8pg2N104xxNCf7m9GCTkT+OaqrPLzU1zIEm2+oJHr7AJK6dCpQ/dWVHLvOJ
	lYqdUqCwJI0qeZmpmQ0V4S2r3A6nXs0sLRYQ1oMTHiH5eSIFdkGRQI59m7FsClzm
	y/5W+ij1Y7m+iDck85Qq4OtfUG1nIn1milSOJUi2VDZ3FIchygIp/rBfEG3xoydE
	xPVyZ+RTUQoYKyyy+/zRtQreAj9TqDvsHrF7zQQF+zfb6DemWUEzRsFVt1pYM/vH
	JJgXaGq1vef3GKHbFj+7NtTjeb7Vg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hwytcjkhf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:33:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGe8O5jCPmINCZ4ZuFt9KVFhfWJDZAiVfrLcsQZDevGSaRTTVCIxXRoYgG2gb0i9L4OW+yfJQJX5gYbR4Wothtg4H9yCfWLT5GZkhQDwvX/CB8f7QuGSrwQ3wAB/3VFrky1wXr0jCLnVHRv0/Bn/xRozmk7oFts3xeA6bgswfnV23tUtWzInTGxs6rsQSfRPZwFDWQak1knazMmDE0+0trtGGIwm5gX8a3zG9GTNfJL5OXFaERnOca4MyfwPPzuWJDexNY/fCC6NYDH81BPpf8cOBgqwEN5O40akpGevIfD0AiJ8/j3PbqnDCDGLTnihTpYBjfp15xd9GWvvDaSm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrv6WxaSkcIQhwvdW2KW5j9DQg5a7d1eob3zqTapfPg=;
 b=wJxrJjTX6GYg74vpnUlk58PKQ4VBM/svI9VWqUrB9rH/B3T243wm38phwIRw4YqBgaqLeyc3NHG25FYwSvFdC/7mwYoRegktDpQjNvSDeR2UEswj/4VWWoqQwwx/tKoegKVg9fHCxZsVwP7T2CUjzT8U/ONkjFt5sXY8G3TuNJ5Rs7ed08CArNL8TtE7cxR8dJQCKkkTFBtoS3ldUAEpKvJNBfC5PiXsZ2InfritZQaemt2+Kd4BLiocu3/SFdeqPwSLyCSXnlD2kfy2L0rdpNzx9K6TlyQh6oaRXZI+5FkGCPH2rynwWjQDJ831m+3WT3wShrElfY7y2LXvLIaCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrv6WxaSkcIQhwvdW2KW5j9DQg5a7d1eob3zqTapfPg=;
 b=sjMepTuh1FlF15OKOxlRZ6lXFXt2UFCIFxsChQ5AL1nAxi8qQj9Vi9jynZZYHkD5fHgxFiI4SsKj1cQ2yu1+xDPlxiZjfzMjA3tZnUOB9tdOMWqBDcKqMZncS95O+q5vyb4pcnDHRhj8P3mNI63b71EHvHG3I4HePmwXkCSXf08=
Received: from BN9PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:fb::32)
 by IA1PR10MB6219.namprd10.prod.outlook.com (2603:10b6:208:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 16:28:15 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::42) by BN9PR03CA0057.outlook.office365.com
 (2603:10b6:408:fb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 16:28:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Fri, 13 Nov 2026 16:28:15 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 10:27:48 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 10:27:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 10:27:48 -0600
Received: from [10.249.34.41] ([10.249.34.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADGRlW7299612;
	Fri, 13 Nov 2026 10:27:47 -0600
Message-ID: <736331db-8599-46fe-afb2-85b1fd1c5954@ti.com>
Date: Fri, 13 Nov 2026 10:27:47 -0600
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
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261112214223.765100-1-afd@ti.com>
 <c7d332ad-09df-42ca-a73d-2dc48ff2c245@app.fastmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <c7d332ad-09df-42ca-a73d-2dc48ff2c245@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|IA1PR10MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: d579d914-a0e9-4588-a3ce-08df41a31e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700016|23010399003|82310400026|10067099003|921020|261026121527099003|261022105027099003|4143699003|56012099006|261009223027099003|261028144727099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+XCbO+y4YSs7Mapf4oZno3dshZ2a0ifytNzv1GxoYrerjVU8JI8/icW58leftFchOsK88I/EoJWNbWADZwn5Tr+yjgqfG+xvRdyWIPcj+LoyzrI+MKJe8qRhS/a3j/bpa0H5DfeW7XjMjKUKLgMPTs6hnTKN/9nhG8Qp0IGgM4IPdMPjohSmUanOZ+dD9E5uj0RIKGQbfkWT1vOiBrnh/wF+ho07HqG4H5HsxKnvur9mCl8jRt+3VRd1w8rLFt3pYQlUD+9f6JoOtvp+ANmBPhVQmqYBtSOGhZ26JY/sCXcOfzOP3esXbo7+233uHBhO3jVKxVjj7z55jNTYlP1FANXnQ59HJ5nuZH4XphnJdIRrpr1Pyg5De3E5y2mUlFDiEr7EH3mGwgj+qsKaWBNiKuDI8AnqMK+Ue2WYUkrKu94AOWc5GxxanV3gdZ7IpZkDy60/q+xNI5JfdMK1ML5RNcHiPbASCSpd3deXiiDFH9xxSpa09yO4NWllh0BsY6qrPu7zclVAtZd3PuQ8DNiWLhdCV4M+vUf1wit9UndgBwyHMjADfbOKO3NGdTFQdvISQn9/iNSPkO5ebFaPGuRDlACeV7pEvB+FeEdLhQHzK+H2WucdVwSNcTE3QmGNsGIG/AtPwzdDCFbIZEtIPLI4oDNSCJUHlCQjFhFVvzt3wZpXfKrPVDHPmYtL220jmWieu3lAg1CLHgxVYtPwzuiFFmhujZ+jXZv3Gj7Xtb7wOduYoivZybStcL6Aq+B0C5tE
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700016)(23010399003)(82310400026)(10067099003)(921020)(261026121527099003)(261022105027099003)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oZmXJsbZWWLCHfr6ep/pu9JimLrSAYm6hbydyqwgE2ONXzIeHV2OXKwlAPK73AoUC+GMSLW4KcPDnfVu3PPs+Qvb6ppVFCBaf5U01IJ8/7nKuDPtZkrjcQMo49Jkgof0PiA9cmxEixsyo715vzHTN9cY+DoVe2xGnHU2iVmSdJaSYcWUQ7l8ARcoeYxpuDmq+HW4/CD8IARmCUTysJQZs8CtQHLNQ1fpeVbPCfm1YjXAJZunJFgmjBDdDOySEv7zwdxNjXiE+6s4wF0h5FagK/A0kHu5sMnwsmU3IyBmhA7mW/4gmFsyaOk0NRMYPu/jt/jMwlAL4hhWGHh4uJPiWGTa9x8tdDVHW1ZEjzouSwkJEyGZ6+VyMGDHeSLS5Gp/1C2CjCld4PthYYLxaEzICHfIx/yFnVWiBzX4R+O//NVwx7f6pq/bCeP2EJ2kk7kU
X-Exchange-RoutingPolicyChecked:
	OO2e0/gc6sxMDG1iM3g7jUDMxcUPIq28sbbZgkyFtth8cClmPXWyJHSk9SFDmHyZHcmgO4KylgLRND9Q2zRg5YmnUOTK4X8P0i5ynkJpDiIBkqAykU5SP+9DFA5IrwKmenGkrL9HjV+EjOllEtC2eDnHiwltmAaD1j6euqpCLvuIkW9ZG6tWERY/4MG6bHyMXJduxlb3oGMKsKnAUcHZ5lt9wkN33vI9bgce/CzpWPDeD23QL9Y1X9t4tc5JPiIOS6rGSS0WwgD7Lcj7a17DYMZTw+u1s5Y2ZmIdZjPKmknnBWg0XBFHTNVw8I5RYHBaVEbfP7lpHpPq+GUXkylHWw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:28:15.6940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d579d914-a0e9-4588-a3ce-08df41a31e90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6219
X-Proofpoint-ORIG-GUID: dWvqKsPsBItZLRkCdRFzeCayVCfX5dqP
X-Authority-Analysis: v=2.4 cv=fYI4WEQF c=1 sm=1 tr=0 ts=6af73bed cx=c_pps
 a=ck9HhUZGATh9INII0mabYg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=a_2n-ALZ5GMI-ur_ftUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX6gHmfHOVAJjv
 MZTdApMepr6D6hJ1T6/hT+GSySlS2PK6mXNsPt1kcNH6SCvEmIcz/AL8oai4tDSF9J0ffuex/gq
 pJp/P/0u0SjvtkvVGTUKXVusW6JOkME=
X-Proofpoint-GUID: dWvqKsPsBItZLRkCdRFzeCayVCfX5dqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX5eeQOYQKfrIj
 S2Tvx4x90Ht4k/oqor3axiXJsaTX005jmEaFdVCmKxNDmvMqj8x6fJEfTp0M/XgH2EF9Tr76+vp
 Sega8gJavuTtBDyJNVbPaTdij9RN82/JAdMykrz0Ab0igJQ++5MJ5nXgDtGoFWQTZk6pDO39/gN
 a31P+Or3VyYH9ux3AWs5GgwyNe5DFVFAummEbMQgz0W2GnnWUOauQ2u8R/tDhYeDAyS3M08aJrt
 Q5Bqxsia81ttA/5P5VLifVUz8qAhtvaV/EFSbjw9GhD2NHgc8/9vb/ltE0qS3VbNe4xFqxvyfJh
 mN1kSq2eSodxDRa1Lvh/S0dejjlQnNhCYacUByQtS74h8+VOvzcyFZabDFhZpT2XxcpBvxNzIdr
 0iuU5YWiftxL4zUqT2w89N5U7xscAELTult+2BkczXGyMX45DeX/onrylnW01otV+jbslXCPC/4
 2ZvDY/OsCG90g4RGi7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130065

On 11/13/26 7:27 AM, Arnd Bergmann wrote:
> On Thu, Nov 12, 2026, at 22:42, Andrew Davis wrote:
>> Many ARCH_HAS_* symbols change some behavior based on what an ARCH
>> supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
>> for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
>> middleman and directly select RESET_CONTROLLER, and many already do.
>>
>> Replace all selection of this symbol with a direct selection of
>> RESET_CONTROLLER when it is not already in the selection list. In the
>> latter case when RESET_CONTROLLER is also already selected we can simply
>> remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.
> 
> This is fine
> 
>> Some ARCHs "select" this symbol when they actually "depend on" the
>> RESET_CONTROLLER framework to build, in those cases the indirect select
>> could lead to broken randconfig builds. In cases when it is not needed
>> for building the ARCH code, these selections can be switched to the weaker
>> "imply" to allow it deselected for minimal builds without reset support.
>> Additional checking will be needed to find such cases.
> 
> Please don't recommend the use of 'imply', this is rarely what you
> want and everyone misunderstands what it does.
> 

Fair enough, I'll drop this suggestion for v2.

> If you want to have a default, please add another symbol and use
> that as the default value, such as
> 
> config ARCH_WANT_RESET_CONTROLLER
>        bool
> 

Could work, but in this case most of these ARCH don't actually "want"
the reset controller, at least not more than they want any other
random subsystem for which they have drivers like GPIO, NET, etc..

In a few cases there is an actual hard dependency as some ARCH code
calls into the reset controller framework, and in those cases directly
selecting RESET_CONTROLLER seems more correct than going through some
a "ARCH_WANT" symbol.

Andrew

> 
> 
>         Arnd

