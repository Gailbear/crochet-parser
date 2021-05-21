export enum StitchType {
  SINGLE = "sc",
  DOUBLE = "dc",
  HDC = "hdc",
  TRIPLE = "tc",
  CHAIN = "ch",
  SLIP = "sl st",
  FPDC = "fpdc",
  BPDC = "bpdc",
  CLUSTER = "cluster",
  MAGIC_RING = "mr"
}

export interface CustomStitchType {
  name: string;
  notation: string;
  image?: string;
}

export interface Stitch {
  id?: String;
  type: StitchType | CustomStitchType;
  prev: Stitch;
  next: Stitch;
  base: Stitch;
}
