Received: from multi.imgtec.com ([194.200.65.239]:50463 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835001Ab3FSVzQnl-HP (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Jun 2013 23:55:16 +0200
Message-ID: <51C22869.6050909@imgtec.com>
Date: Wed, 19 Jun 2013 16:53:45 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/3] MIPS: microMIPS: Fix POOL16C minor opcode enum
References: <20130527124421.GA32322@hades>
In-Reply-To: <20130527124421.GA32322@hades>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Tony Wu <tung7970@gmail.com>
Cc: macro@linux-mips.org, david.daney@cavium.com, linux-mips@linux-mips.org
Message-ID: <20130619215345.R3x8SsCOIdNJ2b-hY1sPvRBXt9Ptz2QCKChQ47B44As@z>

On 05/27/2013 07:44 AM, Tony Wu wrote:
> As pointed out by Maciej, POOL16C minor opcodes were mostly shifted
> by one bit. Correct those opcodes, and also add jraddiusp to the enum.
>
> Signed-off-by: Tony Wu <tung7970@gmail.com>
> Cc: Maciej W. Rozycki <macro@linux-mips.org>
> Cc: Steven J. Hill <Steven.Hill@imgtec.com>
>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
