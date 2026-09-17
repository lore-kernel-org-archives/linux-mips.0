Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692A4F3916;
	Thu, 17 Sep 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664644; cv=fail; b=uNb9Ty4zdkZTWvenMpOwW9jqm3Z3S29+5BA1SU7X/bw7dYleo8xMQXS3RI5Ai3qD/x5f6gemWs8n4QCjb/w5YcB+DvNSL/c+7ec/QoioEk3lDtGvOJhkoQHqdDfW2f9RclJQj71F8gZWlgVeVht7Jo2YZBWy4m6fDqizonnGofc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664644; c=relaxed/simple;
	bh=3oOnq8cVSqD7FF0ljlCkmTw/0yYReZS8LtKQ0NDDMiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m1J9lut+pBmC4UjaSAvQPoukxy8BWUirkr8DHQB1bj2MZmAatwXMikcOcypLEng9MUTgrv88/Lzv/uaJpkj2VKDeftqNWlpjneTkbdlJqDFtumizdvz7f0+HWaZitNruwY01qLj1hauA/nILXrkrtqed1HkDlIo2T1F8sejv7eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o51/sb+F; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o51/sb+F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok5KcLiIRJ9/XhnhP8BavHwPgysMz2H+atWeHT1NItngkiRaeiCfXgBrS6MpUoSiPnRf0xBsAB7LpsuCMJApwmjmmZ2jW4XwBE4Buc7/tvzXsIB4zrYFgR5+pE2ROiPIJOxDdS6DKa9l7ZGQxfVtk7zFX/4+QrtGs3P02hjgotyAKf3qpdhMJj9n14MUU8pW0MrLCPrSH8UTW8ZeaRvtL0CVe+tEPcQJShrZtmkq3cVWDqo80OurwA+ouEHDhhF+b2yaK68t4Jgy5SxI9c2SC2hIapbu7Y6BYIqM/USiOI3nkQe2TQgm4aHVFCQLDSP2UiOlV7EEbfeMKeFG9DDfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhSr8cj1YPQ4FSdk0Jq0j++PQzCDwfIfDg2oJ0fDllo=;
 b=rEP1kLuKfJNORaG33qfq3u/PZHsIrHHquIIW+n4di8uaFt97GeQFGzOg9mzI7fyBkwvysca2kNo1PLhfLEMVkT020yc5wiWQhS/vnj3nnAFdySEdu09VqwI6/wRpG5F7ZUBOb+ik8686LE58/yK8otMQNyt2kwlkIPsxTyfhPZemVM8+geXbGoSa+XyPWSTMs3DUrmC9ZJqKKJ/sCE1/c7AKz8FyQdyHJFLYAngJfwJYciww+2k3oiMmcJNWuTah1P2Jiv711B0F+6PbNMFtRrYnlab/V6XOehieq3P/TqIHgh4M8MCmHGQn5T64FhYUsfurIkMEgNwkgfTdQnbgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhSr8cj1YPQ4FSdk0Jq0j++PQzCDwfIfDg2oJ0fDllo=;
 b=o51/sb+F7musXE848qu9cwfTuDIsngJoCskoA582kOJopkEtr7AkUZuPucBj/4nPYY1voC/oO1h5ZhWwhOBhAdIyJEElIrdQIC8FohmAWzQwpKvwGxDPqYSVoYXTCIJHRg1ZutJfGEvTzbLp6klsZYMso8E1n36xRabqtYsc6T3xuMxwF26aqcXpJqSrUvG6Y9A5ZOYWjJZs3MKAxMIObo6qoBoKpVq4u4MhdfGhKd1/RZ++RWkY5jK3xxVzqG6rhr7LsdlYwvvir3VeXB88Pxdq4VteYf9IDLW8cbSZZsvbFPxZZh2/QWy/660FE2uoQaNumSdHCizAKtZ9ejhSOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB105056.eurprd04.prod.outlook.com (2603:10a6:290:e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 17:03:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 17:03:59 +0000
Date: Thu, 17 Sep 2026 12:03:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
Message-ID: <aqwddneAK_yPAkVS@SMW015318>
References: <20260917163025.7171-1-mahad.ibrahim.dev@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917163025.7171-1-mahad.ibrahim.dev@gmail.com>
X-ClientProxiedBy: PH8P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB105056:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2e84be-a5b4-44a5-b1f5-08df14ddaa82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8MdQlQeCZUqS7w1FiErHxstKPpZoDjWCW4GpukmiamrpEjnSpd46UKVa3e0WQa/q7TrQuRnwoPcgLBRJ9SAPybBDoS8k4JoLuyl4eSqS7nOHw42bDyJk0xM5b9TovY4Zzk4vgnz9lRYHeZXjlRprBzfMTOJT3RO+ipHiMANt5adOcAeB67E3x5FpF7azKQNzujrHrLTs/RGfG/VCd9ABFHLZBJKDdCAxEC4+gstE2zb0l1NrSJKYXZM9XE+imuEt866XAPbu5jjmegeTLxo/kATUNc1krWj6xZ/hjpuTF45dvbIzZ5RHyG9O0p83nJtcmTS8cXBtp9UEYTzErgTjq86zom82JYYrSBjhVXuOyV890l12LZBeZGAR5ybBMMnNT6JqTEzVwo5ADGDDVKaQj7e+AtxZ2Kjl2dteh5hsUSsiAGCd0NEybKScGu7alxUqMVw1cPH1hUNvO41axdhx2338NsfIKYjspZdZ3EMYte8kq80/UidO3xnFvwkSaxnISzp4xFYIkQ5Rgycs38miGli9+hgtPK0bdIXcHb1wPk9cfdvdxf4LVlYxJY1oUjvYb0LCwFKjaP5wTMYNv2RgAlA4sI3YNagGjvMParT/q6nBl2Gm/C9HjsFvCURVnFgKB7Qw1oJ9E8qBpMSd76jhNNdz0TScXflqI8QXUku/0nc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYsI6MpYpGjxTXceeZzsVjN/ZSbXN0zzDjs6P84Fcwz/PY/g9paARW6zfdAM?=
 =?us-ascii?Q?ZbtSAMVGD6/8anAZV+ma0fMWHWIFUCqFzdjZU17rtR4kdykpAUdShZfePJwI?=
 =?us-ascii?Q?s2u4LDXFITVy271WeSYXOELv7cmU9j500/e8FG0shU8s9OpDgqWZxBZRZ809?=
 =?us-ascii?Q?lnbiANqHSuWbdXV+Jc9cqDnNUll5gePRjCcMd5szP773W8UWccOle/NvORyP?=
 =?us-ascii?Q?VNIcrZj5RTXuAarvP7w2NSPDIolA3SyH1+RAL9oV4FYTHXPK7KEXae1lM2xA?=
 =?us-ascii?Q?nY5eYsE3kAE6jTRUVJ7PpXGeOonOwFaiLFdPO2P3CtJp1r5S44jmY37sQF7z?=
 =?us-ascii?Q?K6jrqXgqCS5nEDHxX3LrwECrDjdUCDkG+2VtCzErhPmsL1Vgh6Wr9/SYpacS?=
 =?us-ascii?Q?c1UFsLlam/DtfY+rs3V0nrLKEjp8YrZHQURZ6nJW4ArunyG+GNW2tdvfYr7r?=
 =?us-ascii?Q?zE88oluwwAnDH97nGmKgLiLjmzADuPGSgEeoavidqSr6WUYr04zgGehGUOhQ?=
 =?us-ascii?Q?PYDy36LOTIeJoT3pYkP1SuKWx5m4Uf1xd6lppnuXUZYMPjIDuuI+HQ7rKvlY?=
 =?us-ascii?Q?pLoxUp1BK9xQcgLmIkPIXJYpL8ocnePPaOO9SHHOXIxQMk/rDcwsOQ/bDqbm?=
 =?us-ascii?Q?/h6xUFIz23XyVlKB1YsKtF4Mp6+yqBwGjx0vfNTtAgkjyqQ5EftY8At0fCuG?=
 =?us-ascii?Q?Vuh4oBSuNhYjSzX4fF8idx64oK/gSFSmkivDnCRdqOvG2N/XrlkR/ktWiNDs?=
 =?us-ascii?Q?YHCqQc11QY17rDSD465XXfcFdRufQ6OlfH4/jLICCP9xvlJ/pmGgrHvZAy/W?=
 =?us-ascii?Q?N5JpEAbQ8gfv6EiXx9tFwt4rWP5Y9xBY5Avn0NasmDVln09hXZfUrCKJQck7?=
 =?us-ascii?Q?FcXVyppRhnKbX4kFRHzyBwwJAnykIZLRCUx5NRC0zsBq4ioekD3QinsizSkV?=
 =?us-ascii?Q?+0KL4Tiemvq8PSOmwLtEXCaMXh6qm8W6Ese6cArBq1uddaPgM2d7OR5G/riP?=
 =?us-ascii?Q?t8uMS/WmZv3qA2fmZKC3lIo7nRaTWzm9KhlyruiQ2BfNMNWfn9cpoK2gYBsv?=
 =?us-ascii?Q?aKxBPHhQUYypNVQTM3HdSnPg4kApnpDYc4nUz9IERMLue0ZdDsB1YMAMorMl?=
 =?us-ascii?Q?rKklJKKeDOafB5K/vGcdLpth5YEY7VHvRuvnAZ4IhuANddvvvPZkYz8/JLrX?=
 =?us-ascii?Q?0CSjkKnmQTn496mY51aPjrEhtdzwBA6rL/E1JuyUGnzmss/rnuMZlbcc+YdA?=
 =?us-ascii?Q?gahiyvCqkFvHDC9hy9lJbs4im2AKPHAexvWgE7PXRnWBm9xH/YrzD12JH+jx?=
 =?us-ascii?Q?Z4Z5OMcYlwJUDRlUXctwRZzK5hDZOdGeV1nPlGA1QKqRPZei2ZQ8ATC9lyxH?=
 =?us-ascii?Q?Ro49nVG+CPpDwD6dpBn+K+OvKQxAuAZgIdeD2WKTY9tOujKteAxc3aCYY42F?=
 =?us-ascii?Q?9F6yzRHEcPcPOzpi7Y54CHlM0D0Vb/gzE26kZ/J9I9Zn75JhHCLPOluTRQp/?=
 =?us-ascii?Q?R+YGUkLPC9VTZlP4fiDZx8N0bTOj9g2FRfHGLIzEyBDcnBcS8jmpstwUWDwI?=
 =?us-ascii?Q?b+yXDutZZSznkyTz/xmDOEgEq5Oi9RAwIiw1mqi2RX483V0HOmqxC4Ad/BaF?=
 =?us-ascii?Q?xaQO54RK0A5KKJZYinVRpad+idVIuENieSa3FP+8YZBkyHFtsFAY/Dev7Ab2?=
 =?us-ascii?Q?pzEmGl5dX/pte0rzVvSHK1JeInUwoj6s5ftGSHrnJI0u/PGZuGw404sRJ+Lm?=
 =?us-ascii?Q?1TOD9qPHIVCxi5PguaSPSI9ZZI0700d1HZ/vd6eSeKB6FrWCO8IG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2e84be-a5b4-44a5-b1f5-08df14ddaa82
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 17:03:59.4149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiOMFJIayfNYY2jH/Q0v+Ks+G0VlpCEglihlPfUkyKJo5UbeKX8R921gXMtAVIExc9QBth4bhWBgTpHtWB3LXdSfiDN87wW4gPl8VvCmsPTRmKG2iViJrvgXBdetoCeb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB105056

On Thu, Sep 17, 2026 at 04:30:25PM +0000, Mahad Ibrahim wrote:
> ls1x_dma_tx_status() locates the descriptor actively being processed by
> walking the LLI list and comparing the hardware reported next descriptor
> pointer against each element's next-descriptor pointer.
>
> A list_for_each_entry macro is used in the comparison phase, which at
> the end of the loop leaves the lli pointer at the currently executing LLI.
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
> Compile test only; Hardware testing by Keguang Zhang.
>
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
> Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> v2:
> - encapsulate residue calculation and dev_dbg inside the
>   list_for_each_entry() macro. Treat non-matching LLI as an unexpected
>   case.
> - link: https://lore.kernel.org/all/20260729143247.6111-1-mahad.ibrahim.dev@gmail.com/
>
>
> v3:
> - Collect tags from Keguang Zhang.
> - Repost patch in a new thread.
> - Change chan2dev to the newer dmaengine_chan_dev.
>
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
> index 46b4bfef45e2..e62ab26c8327 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -441,22 +441,27 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
>
>  			/* locate the current lli */
>  			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
> -			list_for_each_entry(lli, &desc->lli_list, node)
> -				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
> -					break;
> +			list_for_each_entry(lli, &desc->lli_list, node) {
> +				if (lli->hw[LS1X_DMADESC_NEXT] != next_phys)
> +					continue;
>
> -			dev_dbg(dmaengine_chan_dev(dchan), "current lli_phys=%pad",
> -				&lli->phys);
> +				dev_dbg(dmaengine_chan_dev(dchan), "current lli_phys=%pad\n",
> +					&lli->phys);
>
> -			/* count the residues */
> -			list_for_each_entry_from(lli, &desc->lli_list, node)
> -				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
> -					 chan->bus_width;
> +				/* count the residues */
> +				list_for_each_entry_from(lli, &desc->lli_list, node)
> +					bytes += lli->hw[LS1X_DMADESC_LENGTH] *
> +						 chan->bus_width;
> +
> +				dma_set_residue(state, bytes);
> +				return status;
> +			}
> +
> +			dev_warn(dmaengine_chan_dev(dchan),
> +				 "unable to locate current lli.\n");
>  		}
>  	}
>
> -	dma_set_residue(state, bytes);
> -
>  	return status;
>  }
>
> --
> 2.54.0
>
