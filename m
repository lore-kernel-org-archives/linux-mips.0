Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69BB282F27
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331663; cv=none; b=TSzeLUEcVAkzpd1ZFHUvPBQIzWzA/+a0gORX7BvKhO/U64pL9EftgHLbeFkPRxCWKiIKr9FE/fdkFg6y9N+xhor/CT9xTVjvgO+4Ull0mcdeKqFg0mx6fg+90RviXJyM8B+iQj008GK6oM+RxjFJypiFytS19uDsDlooMxCzC2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331663; c=relaxed/simple;
	bh=hJVZGjdzMszsM5bjwrmT88RtUDhCOhiCTzcuewL63EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpQwMBfcH3HrIrTcmNtLBf6+LamdmXq3PLA0YvCxSC+BRQD+95Dpb2AEO0arEsytW4oHDrov7aqcBzVtxk9yhXRPpZGOrhlzD7GXLMxwvQCTEgrOIK3wcTxQiKwxBHMV19y7EZtQ0Ank39YRdQvMEsXxFfhniioF6MmlOzEAQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCjKCX5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXSUJvB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCjKCX5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXSUJvB/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LT09W3772196
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c20YFg7R+aIz/hgdPzYueBJ9BwfxuVTOpY3oG8UMOr0=; b=PCjKCX5Ofd+7t3oH
	jGFoKUF1nRrglUXU2SIReN7qrYQ2HncGc+x/56ijyhXfXyjosTfaopA13lvnBFuz
	QSLuwioIX7ZQuYffzZ00RcWHsu3ykXYxz5T/Zj6u7UcmPPbANFV57YUz3vqryp7o
	e/egEF6jIhNZFEQ90cE3Av1v6gaEu6T7Ee3xZfPuly/xRuxLqBAHbDtIC9406HqA
	sObhoyFKPKGqsyo3OxOhgPJgoi9Gh+cRj4aNWFWEQEbReqBw8EXCpmIkWT28/gNj
	SDQRAJg6DDBUH4EMkYWsPamzAI9j5r66VcA1tdswOZXpZ1W000R80/jMf9S3YyFW
	H/w1oA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush47h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:14:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso12787501cf.2
        for <linux-mips@vger.kernel.org>; Sun, 09 Aug 2026 20:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786331655; x=1786936455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c20YFg7R+aIz/hgdPzYueBJ9BwfxuVTOpY3oG8UMOr0=;
        b=YXSUJvB/LR639BRMr16COatmxzLXQOvVp9KA+Ss09ZbvcrKjEAEvuud+wGCy0f6tsz
         uFlCeDHLKuWF7xrC37B4UOxc6uwU9a9oHohGbvkxHQxcWsLVGx5B9TGlNAHS7iOF5EO0
         SEv6khmT+nOEPE5TOzRjLtQr8oNbAIJQFLlMaEp6q6il8qITc8IxFikpBh452GmGk2JR
         bFOnbKk4PUCuBRO94gNtJij2nmG4XLEeVdIsRrcdO7ThgsKGoApcX34ZeChQTbwtOiXk
         9ld/kC3MGEyJPZplvtx04fhQiUBasg168+s/qvH8lcU9vF64PUQCvS0qn1G6AQKFgi+b
         gAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786331655; x=1786936455;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c20YFg7R+aIz/hgdPzYueBJ9BwfxuVTOpY3oG8UMOr0=;
        b=isvUaXrfi3w6R4ud73rS1dLcGPJEXQW//LSGNGtvatE82T+AF3fdgNfSnBgenk0WfC
         QMZbNJALth8HVq+3+UFRGLw8MLYpjVzB05EO2ksCgoC9PCPOuUJODrQRlpC18bbnzn/6
         b5flXV2dqhd6v+kWO/yVUhmVmctikagII00M4Vss2xSzR3YK7uwWDeF0QDWE1rLpnlwT
         B/Pb8lssTMyrch8S9AvRlAaQovD2n4GVmmKDwchqkaGitmln9rfkyhfXnQtTAqVVSvTM
         qvkLCKPWpDPfZsib/Z1h8M2iOt9i6ZWKjy7pYVkKmZNpI2iENpx7630U6QFkeiJwCVJe
         5GRw==
X-Gm-Message-State: AOJu0Yyfn409ZTOUWRuOJ4wmrXfGlfr7yNeqZIKqVY8pqDxafrb+NbXw
	WmwfxMbdR060JgwaBr2FP+64kJ1TGok1CaFapCs+sbUlvutWvuxxJJQh+ClnNC0xtL1sHaIIhbR
	MoXP5vwTuAE4Z7G/QXWZ8OSDqXHivmjI6usDFjzk2DyEE06IIf9PrijHCItlj2Eu4
X-Gm-Gg: AR+sD11Rh7uJfqlwnlp2jaJLzxaYWn9lcxw4MY8yktUGgHT8rEt5EJRWhoFoZzUwUbO
	A+pne5VijYZ1FIvRfK3TMEPhWoRopRF12pFV5lQvei7X0FshPytOg+If2yYf/JVhLCr3wqm1R/A
	YK8WiBKAYvWOZflTYWwb3uHwoa7/CBejOmaSdTc2RFza/QqOt0/4cUnCVdt9dBRVDChSfiw/W3b
	FjEOfTitNo5kEivoSHGaj5xL0yPXA/QBTcEHrLqewln+GMVwvSs2PKhJ6XCPIO25RFYJ8QyMy0m
	A4uE9jkzU02pTO+CT4gT65qgoo6KWnNWrSyLGot+w5BCq7EfNLgyCMKgjwt8SC79fqLdUbTB2TQ
	sQ8mozlgjFGqt2ALRr9Y4ry+3VapsqaBe040=
X-Received: by 2002:ac8:58ce:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52ce614ba88mr400898801cf.32.1786331654631;
        Sun, 09 Aug 2026 20:14:14 -0700 (PDT)
X-Received: by 2002:ac8:58ce:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52ce614ba88mr400898361cf.32.1786331654128;
        Sun, 09 Aug 2026 20:14:14 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021501bcsm29134102f8f.9.2026.08.09.20.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 20:14:13 -0700 (PDT)
Message-ID: <f1067d27-6b39-433f-b1e2-ad753e54153d@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 05:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] serial: sb1250-duart: Fix bootconsole handover
 lockup
Content-Language: en-US
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060359330.55540@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2608060359330.55540@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 08a38UOc0TdfQzuGQ9EfiyclhZh4v2_A
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a79420c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=_xeo5rayHQ2-IrAwGUsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-ORIG-GUID: 08a38UOc0TdfQzuGQ9EfiyclhZh4v2_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyNCBTYWx0ZWRfX7uNK3CNsiXSU
 /9Htif8SXlUe7BB0RHArqhKHH//paXLHLfGVywvrxPKY898174WtxHgbN701dxrY0mS6fnRYiJi
 WAJh1ug+btHM0sM8Xw45+uSRFILLTMqvLNkfCApUXmuuVr1yjWZ2WvttTbWURoKF3WZfbB4D5mX
 vJ0uzn7Iu8jDW8swAqmd4cO7y9FRxvXqf7QcW4QK835VqFhiNp3WfhNTgnuVwc3Vp3wi+MrcwOb
 a02IpYix7j5y4KUhg4/T6uJtuSABH/3ozkmJyEnswPcgSRpYJ6nyimYt0g8BhignSMh/M4C5zeM
 t6feWa9ZOl+aJE5T4lJqkY5OZ6yIc1h5eGzIlVJQx6K68iGYr2QxlTq/z/iE4Ts2qrpeEaApOc5
 9iduh0XtMSIzG4b86FtKp9WG6mR6oK/2rzBo0FgFOK54PVc/mJpyG1N9qeqejlHFlJSBqujCxWg
 ZCmPzZy3oAg6fuoDeqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyNCBTYWx0ZWRfX31ShKs3n7Ea6
 34VpfgVgqALX3fs/IEzEj5XjzRcB+xO9ujQg8yFBUIz60DweSbD0jW0olR5ZxssNZmmQBEBVtP3
 KqtCf0iYoeD2Yu9jwAoX8S985osPXfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100024

On 6/8/26 12:54, Maciej W. Rozycki wrote:
> Calling sbd_init_port() in the course of setting up the serial device
> causes line parameters to be messed up and the transmitter disabled.
> We've been lucky in that no message is usually produced to the kernel
> log between this call and the later call to uart_set_options() in the
> course of console setup done by sbd_serial_console_init(), or the system
> would hang as the console output handler in CFE tried to access a port
> whose transmitter has been disabled and line parameters messed up.
> 
> It'll change with the next change to the driver, so fix sbd_init_port()
> such that line parameters are set for 115200n8 console operation as with
> the CFE firmware and the transmitter re-enabled after reset.
> 
> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v6.5+
> ---
> No change from v2 (2/3),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2605241623110.1450@angie.orcam.me.uk/>.
> 
> Changes from v1 (2/4),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2604130338210.29980@angie.orcam.me.uk/>:
> 
> - Sanitise the change heading.
> ---
>   drivers/tty/serial/sb1250-duart.c |    7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> linux-serial-sb1250-duart-prom-console.diff
> Index: linux-macro/drivers/tty/serial/sb1250-duart.c
> ===================================================================
> --- linux-macro.orig/drivers/tty/serial/sb1250-duart.c
> +++ linux-macro/drivers/tty/serial/sb1250-duart.c
> @@ -542,14 +542,19 @@ static void sbd_init_port(struct sbd_por
>   	/* There is no DUART reset feature, so just set some sane defaults.  */
>   	write_sbdchn(sport, R_DUART_CMD, V_DUART_MISC_CMD_RESET_TX);
>   	write_sbdchn(sport, R_DUART_CMD, V_DUART_MISC_CMD_RESET_RX);
> -	write_sbdchn(sport, R_DUART_MODE_REG_1, V_DUART_BITS_PER_CHAR_8);
> +	write_sbdchn(sport, R_DUART_MODE_REG_1,
> +		     V_DUART_PARITY_MODE_NONE | V_DUART_BITS_PER_CHAR_8);
>   	write_sbdchn(sport, R_DUART_MODE_REG_2, 0);
> +	write_sbdchn(sport, R_DUART_CLK_SEL, V_DUART_BAUD_RATE(115200));
>   	write_sbdchn(sport, R_DUART_FULL_CTL,
>   		     V_DUART_INT_TIME(0) | V_DUART_SIG_FULL(15));
>   	write_sbdchn(sport, R_DUART_OPCR_X, 0);
>   	write_sbdchn(sport, R_DUART_AUXCTL_X, 0);
>   	write_sbdshr(sport, R_DUART_IMRREG((uport->line) % 2), 0);
>   
> +	/* Re-enable transmission for the initial PROM-based console.  */
> +	write_sbdchn(sport, R_DUART_CMD, M_DUART_TX_EN);
> +
>   	sport->initialised = 1;
>   }
>   
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
