import sys

def conllu_to_conllx(line):
    # line = 2  고향은    고향+은    NOUN    NNG+JX    _    3    dislocated    _    _
    splitted_line = line.split()
    conllx_line = splitted_line[:]

    pos_tagged = pos_tag(splitted_line[2], splitted_line[4])
    conllx_line[1] = pos_tagged
    conllx_line[2], conllx_line[3] = '_', '_'
    return '\t'.join(conllx_line)

def pos_tag(morphs, tags):
    # morphs = '고향+은', tags = 'NNG+JX'
    morphs_splitted = morphs.split('+')
    tags_splitted = tags.split('+')
    pos_tagged = [morph + '/' + tag for morph, tag in zip(morphs_splitted, tags_splitted)]
    return '|'.join(pos_tagged)


if __name__ == "__main__":
    in_file = sys.argv[1]
    out_file = sys.argv[2]

    print(("in_file: ", in_file))
    print(("out_file: ", out_file))

    with open(in_file, 'r') as in_f:
        with open(out_file, 'w') as out_f:
            for line in in_f:
                line = line.strip()
                if len(line) == 0:
                    out_f.write('\n')
                    continue
                if line.startswith('#'):
                    continue
                else:
                    conllx_line = conllu_to_conllx(line)
                    out_f.write(conllx_line + '\n')











